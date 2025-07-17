import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/services.dart';

import '../constants/durations.dart';
import '../models/token/token.dart';
import '../util/env.dart';
import 'hive_service.dart';
import 'logger_service.dart';

class TokenService {
  ///
  /// CONSTRUCTOR
  ///

  final LoggerService logger;
  final HiveService hive;

  TokenService({
    required this.logger,
    required this.hive,
  });

  ///
  /// METHODS
  ///

  /// Returns cached or new `token`
  Future<Token?> getToken() async {
    try {
      /// Get `token` from [Hive]
      final cachedToken = hive.getToken();

      /// Store `now` in a variable
      final now = DateTime.now().toUtc();

      /// `token` exists in [Hive]
      if (cachedToken != null) {
        /// Check if cached `token` is still valid
        if (now.isBefore(cachedToken.expiry.subtract(CJVnkDurations.tokenBuffer))) {
          logger.f('TokenService -> getToken() -> Using cached token');
          return cachedToken;
        }
      }

      /// Store new `expiry`
      final expiry = now.add(CJVnkDurations.tokenDuration);

      /// Generate new `token` value
      final newTokenValue = await generateToken(
        now: now,
        expiry: expiry,
      );

      /// New `token` value is generated
      if (newTokenValue != null) {
        final newToken = Token(
          value: newTokenValue,
          expiry: expiry,
        );

        /// Store new `token` in [Hive] and cached variables
        await hive.writeToken(newToken: newToken);

        logger.f('TokenService -> getToken() -> Using new token');
        return newToken;
      }
      /// New `token` value hasn't been generated
      else {
        logger.e("TokenService -> getToken() -> New `token` value hasn't been generated");
        return null;
      }
    } catch (e) {
      logger.e('TokenService -> getToken() -> $e');
      return null;
    }
  }

  /// Generates a new `token` used in API calls
  Future<String?> generateToken({
    required DateTime now,
    required DateTime expiry,
  }) async {
    try {
      /// IDs
      final teamId = Env.teamId;
      final keyId = Env.keyId;
      final serviceId = Env.serviceId;

      /// Time
      final iat = now.millisecondsSinceEpoch ~/ 1000;
      final exp = expiry.millisecondsSinceEpoch ~/ 1000;

      /// Create a `JSON Web Token`
      final jwt = JWT(
        {
          'iss': teamId,
          'iat': iat,
          'exp': exp,
          'sub': serviceId,
        },
        header: {
          'alg': 'ES256',
          'kid': keyId,
          'id': '$teamId.$serviceId',
        },
        issuer: serviceId,
      );

      /// Sign it
      final pem = await rootBundle.loadString(Env.pemAddress);
      final key = ECPrivateKey(pem);

      final token = jwt.sign(
        key,
        algorithm: JWTAlgorithm.ES256,
      );

      return token;
    } catch (e) {
      logger.e('TokenService -> generateJWT() -> $e');
      return null;
    }
  }
}

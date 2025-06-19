import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../hive_registrar.g.dart';
import '../models/token/token.dart';
import '../util/path.dart';
import 'logger_service.dart';

class HiveService implements Disposable {
  final LoggerService logger;

  HiveService({
    required this.logger,
  });

  ///
  /// VARIABLES
  ///

  late final Box<Token> tokens;

  ///
  /// INIT
  ///

  Future<void> init() async {
    final directory = await getHiveDirectory();

    Hive
      ..init(directory?.path)
      ..registerAdapters();

    tokens = await Hive.openBox<Token>('tokensBox');
  }

  ///
  /// DISPOSE
  ///

  @override
  Future<void> onDispose() async {
    await tokens.close();
    await Hive.close();
  }

  ///
  /// METHODS
  ///

  /// Called to get `token` from [Hive]
  Token? getToken() => tokens.get(0);

  /// Stores a new `token` in [Hive]
  Future<void> writeToken({required Token newToken}) async => tokens.put(0, newToken);
}

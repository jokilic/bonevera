import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watch_it/watch_it.dart';

import 'screens/main/main_screen.dart';
import 'services/theme_service.dart';
import 'theme/theme.dart';
import 'util/dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Make sure the orientation is only `portrait`
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  /// Initialize services
  initializeServices();

  /// Wait for initialization to finish
  await getIt.allReady();

  runApp(BoneveraApp());
}

class BoneveraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BoneveraWidget();
}

class BoneveraWidget extends WatchingWidget {
  @override
  Widget build(BuildContext context) {
    final theme = watchIt<ThemeService>().value;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      theme: theme ?? BoneveraTheme.lightBlue,
      darkTheme: theme ?? BoneveraTheme.dark,
      builder: (_, child) {
        final appWidget =
            child ??
            const Scaffold(
              body: SizedBox.shrink(),
            );

        return kDebugMode
            ? Banner(
                message: '',
                color: Colors.indigo,
                location: BannerLocation.topEnd,
                layoutDirection: TextDirection.ltr,
                child: appWidget,
              )
            : appWidget;
      },
    );
  }
}

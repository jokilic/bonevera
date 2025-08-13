import 'package:flutter/services.dart';

// TODO: Use these methods when changing theme & triggering Location drawer

void setStatusBarTextWhite() => SystemChrome.setSystemUIOverlayStyle(
  const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ),
);

void setStatusBarTextDark() => SystemChrome.setSystemUIOverlayStyle(
  const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ),
);

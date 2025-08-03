import 'package:flutter/services.dart';

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

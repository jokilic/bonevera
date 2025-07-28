import 'dart:math';

import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../../constants/durations.dart';
import '../../services/hive_service.dart';
import '../../services/logger_service.dart';
import '../../theme/icons.dart';
import '../../theme/theme.dart';
import '../../util/dependencies.dart';
import '../../widgets/cjvnk_drawer_button.dart';
import '../locations/locations_screen.dart';
import '../weather/weather_screen.dart';
import 'main_controller.dart';

class MainScreen extends WatchingStatefulWidget {
  const MainScreen({
    required super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;
  late final Animation<double> scaleAnimation;

  var isSideMenuOpened = false;

  @override
  void initState() {
    super.initState();

    registerIfNotInitialized<MainController>(
      () => MainController(
        logger: getIt.get<LoggerService>(),
        hive: getIt.get<HiveService>(),
      ),
      instanceName: 'main',
    );

    animationController = AnimationController(
      vsync: this,
      duration: CJVnkDurations.fadeAnimation,
    );

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    getIt.unregister<MainController>(
      instanceName: 'main',
    );

    animationController.dispose();

    super.dispose();
  }

  void drawerButtonPressed() {
    isSideMenuOpened ? animationController.reverse() : animationController.forward();
    setState(
      () => isSideMenuOpened = !isSideMenuOpened,
    );
  }

  @override
  Widget build(BuildContext context) {
    final locationsState = watchIt<MainController>(
      instanceName: 'main',
    ).value;

    final location = locationsState.currentLocation;

    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Stack(
        children: [
          ///
          /// DRAWER
          ///
          if (location != null)
            AnimatedPositioned(
              duration: CJVnkDurations.fadeAnimation,
              curve: Curves.fastOutSlowIn,
              height: double.maxFinite,
              width: 288,
              left: isSideMenuOpened ? 0 : -288,
              child: LocationsScreen(
                drawerButtonPressed: drawerButtonPressed,
                locations: locationsState.locations,
                backgroundColor: context.colors.primary,
                weatherActive: true,
                key: const ValueKey('locations-weather-active'),
              ),
            ),

          ///
          /// WEATHER
          ///
          AnimatedBuilder(
            animation: animationController,
            builder: (_, child) => Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(animation.value - 30 * animation.value * pi / 180),
              child: Transform.translate(
                offset: Offset(animation.value * 240, 0),
                child: Transform.scale(
                  scale: scaleAnimation.value,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: location != null
                        ? WeatherScreen(
                            location: location,
                            key: ValueKey(location),
                          )
                        : LocationsScreen(
                            drawerButtonPressed: drawerButtonPressed,
                            locations: locationsState.locations,
                            backgroundColor: context.colors.primary,
                            weatherActive: false,
                            key: const ValueKey('locations-weather-inactive'),
                          ),
                  ),
                ),
              ),
            ),
          ),

          ///
          /// DRAWER BUTTON
          ///
          if (location != null)
            AnimatedPositioned(
              duration: CJVnkDurations.fadeAnimation,
              curve: Curves.fastOutSlowIn,
              left: isSideMenuOpened ? 184 : 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: CJVnkDrawerButton(
                    onPressed: drawerButtonPressed,
                    icon: isSideMenuOpened ? CJVnkIcons.close : CJVnkIcons.drawer,
                    iconColor: isSideMenuOpened ? context.colors.background : context.colors.primary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

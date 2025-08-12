import 'dart:math';

import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../../constants/durations.dart';
import '../../services/hive_service.dart';
import '../../services/logger_service.dart';
import '../../theme/icons.dart';
import '../../theme/theme.dart';
import '../../util/dependencies.dart';
import '../../widgets/bonevera_drawer_button.dart';
import '../locations/locations_screen.dart';
import '../weather/weather_screen.dart';
import 'locations_controller.dart';

class MainScreen extends WatchingStatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;
  late final Animation<double> scaleAnimation;

  var isSideMenuOpened = false;

  final drawerWidth = 288.0;

  @override
  void initState() {
    super.initState();

    registerIfNotInitialized<LocationsController>(
      () => LocationsController(
        logger: getIt.get<LoggerService>(),
        hive: getIt.get<HiveService>(),
      ),
    );

    animationController = AnimationController(
      vsync: this,
      duration: BoneveraDurations.fadeAnimation,
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

    final locationExists = getIt.get<LocationsController>().value.locations.isNotEmpty && getIt.get<LocationsController>().value.currentLocation != null;

    if (!locationExists) {
      drawerButtonPressed();
    }
  }

  @override
  void dispose() {
    getIt.unregister<LocationsController>();
    animationController.dispose();
    super.dispose();
  }

  void drawerButtonPressed() {
    if (isSideMenuOpened) {
      animationController.reverse();
    } else {
      animationController.forward();
    }

    setState(
      () => isSideMenuOpened = !isSideMenuOpened,
    );
  }

  void onHorizontalDragStart(DragStartDetails details) {
    /// Only allow from left edge
    if (!isSideMenuOpened && details.globalPosition.dx > 40) {
      return;
    }
  }

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    final delta = details.primaryDelta ?? 0;
    final newValue = animationController.value + delta / drawerWidth;
    animationController.value = newValue.clamp(0.0, 1.0);
  }

  void onHorizontalDragEnd(DragEndDetails details) {
    if (animationController.value > 0.5) {
      animationController.forward();
      setState(() => isSideMenuOpened = true);
    } else {
      animationController.reverse();
      setState(() => isSideMenuOpened = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationsState = watchIt<LocationsController>().value;
    final location = locationsState.currentLocation;
    final locationExists = locationsState.locations.isNotEmpty && location != null;

    return GestureDetector(
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd,
      child: Scaffold(
        backgroundColor: context.colors.locationsBackground,
        body: Stack(
          children: [
            ///
            /// DRAWER
            ///
            AnimatedPositioned(
              duration: BoneveraDurations.fadeAnimation,
              curve: Curves.fastOutSlowIn,
              height: double.maxFinite,
              width: drawerWidth,
              left: isSideMenuOpened ? 0 : -drawerWidth,
              child: LocationsScreen(
                drawerButtonPressed: drawerButtonPressed,
                locations: locationsState.locations,
                backgroundColor: context.colors.locationsBackground,
                drawerWidth: drawerWidth,
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
                      child: AnimatedSwitcher(
                        duration: BoneveraDurations.fadeAnimation,
                        switchInCurve: Curves.fastOutSlowIn,
                        switchOutCurve: Curves.fastOutSlowIn,
                        child: locationExists
                            ? WeatherScreen(
                                location: location,
                                key: ValueKey(location),
                              )
                            : Container(
                                color: Colors.greenAccent,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            ///
            /// DRAWER BUTTON
            ///
            AnimatedPositioned(
              duration: BoneveraDurations.fadeAnimation,
              curve: Curves.fastOutSlowIn,
              left: isSideMenuOpened ? 184 : 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: BoneveraDrawerButton(
                    onPressed: drawerButtonPressed,
                    icon: isSideMenuOpened ? BoneveraIcons.close : BoneveraIcons.drawer,
                    iconColor: isSideMenuOpened ? context.colors.locationsText : context.colors.appBarText,
                    isHidden: !locationExists,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

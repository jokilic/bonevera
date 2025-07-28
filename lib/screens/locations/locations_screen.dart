import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../../models/location/location.dart' as cjvnk_location;
import '../../services/logger_service.dart';
import '../../theme/theme.dart';
import '../../util/dependencies.dart';
import '../../util/state.dart';
import '../../widgets/cjvnk_version_logo.dart';
import '../main/main_controller.dart';
import 'locations_controller.dart';
import 'widgets/locations_list.dart';
import 'widgets/locations_search_field.dart';
import 'widgets/locations_success.dart';

class LocationsScreen extends WatchingStatefulWidget {
  final Function() drawerButtonPressed;
  final List<cjvnk_location.Location> locations;
  final Color backgroundColor;
  final bool weatherActive;

  const LocationsScreen({
    required this.drawerButtonPressed,
    required this.locations,
    required this.backgroundColor,
    required this.weatherActive,
    required super.key,
  });

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  @override
  void initState() {
    super.initState();

    registerIfNotInitialized<LocationsController>(
      () => LocationsController(
        logger: getIt.get<LoggerService>(),
      ),
      instanceName: 'locations',
    );
  }

  @override
  void dispose() {
    getIt.unregister<LocationsController>(
      instanceName: 'locations',
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locationsState = watchIt<LocationsController>(
      instanceName: 'locations',
    ).value;

    return Scaffold(
      backgroundColor: context.colors.primary,
      body: SafeArea(
        child: Container(
          width: (widget.weatherActive ? 288 : double.infinity) - 14,
          height: MediaQuery.sizeOf(context).height - 80,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: widget.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              ///
              /// SEARCH
              ///
              Row(
                children: [
                  Expanded(
                    child: LocationsSearchField(
                      textEditingController: getIt
                          .get<LocationsController>(
                            instanceName: 'locations',
                          )
                          .textEditingController,
                      onSubmitted: (address) => getIt
                          .get<LocationsController>(
                            instanceName: 'locations',
                          )
                          .onLocationSearch(address: address.trim()),
                    ),
                  ),
                  if (widget.weatherActive) const SizedBox(width: 72),
                ],
              ),

              ///
              /// SEARCH RESULTS
              ///
              switch (locationsState) {
                Initial() => const SizedBox(height: 24),
                Loading() => Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellowAccent,
                ),
                Empty() => Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey,
                ),
                Error() => Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
                Success() => LocationsSuccess(
                  locations: (locationsState as Success).data,
                  onPressLocation: getIt
                      .get<LocationsController>(
                        instanceName: 'locations',
                      )
                      .locationPressed,
                ),
              },

              ///
              /// LOCATIONS
              ///
              Expanded(
                child: widget.locations.isNotEmpty
                    ? LocationsList(
                        locations: widget.locations,
                        locationPressed: (location) {
                          getIt
                              .get<MainController>(
                                instanceName: 'main',
                              )
                              .updateCurrentLocation(
                                newCurrentLocation: location,
                              );

                          widget.drawerButtonPressed();
                        },
                        onReorder: getIt
                            .get<MainController>(
                              instanceName: 'main',
                            )
                            .reorderLocations,
                        onTapDelete: (handler, location) {
                          handler(false);
                          getIt
                              .get<MainController>(
                                instanceName: 'main',
                              )
                              .deleteLocation(location);
                        },
                      )
                    : const Text(
                        'No locations',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
              ),
              const SizedBox(height: 16),

              ///
              /// ČJVNK LOGO & VERSION
              ///
              CJVnKVersionLogo(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../../constants/durations.dart';
import '../../models/location/location.dart' as bonevera_location;
import '../../services/logger_service.dart';
import '../../theme/theme.dart';
import '../../util/dependencies.dart';
import '../../util/state.dart';
import '../../widgets/bonevera_version_logo.dart';
import '../main/locations_controller.dart';
import 'location_search_controller.dart';
import 'widgets/location_search/location_search_field.dart';
import 'widgets/location_search/location_search_success.dart';
import 'widgets/locations_list.dart';

class LocationsScreen extends WatchingStatefulWidget {
  final Function() drawerButtonPressed;
  final List<bonevera_location.Location> locations;
  final Color backgroundColor;
  final double drawerWidth;

  const LocationsScreen({
    required this.drawerButtonPressed,
    required this.locations,
    required this.backgroundColor,
    required this.drawerWidth,
  });

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  @override
  void initState() {
    super.initState();

    registerIfNotInitialized<LocationSearchController>(
      () => LocationSearchController(
        logger: getIt.get<LoggerService>(),
      ),
    );
  }

  @override
  void dispose() {
    getIt.unregister<LocationSearchController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locationsController = getIt.get<LocationsController>();
    final locationSearchController = getIt.get<LocationSearchController>();

    final locationSearchState = watchIt<LocationSearchController>().value;

    return Scaffold(
      backgroundColor: context.colors.locationsBackground,
      body: SafeArea(
        child: Container(
          width: widget.drawerWidth - 14,
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
                    child: LocationSearchField(
                      textEditingController: locationSearchController.textEditingController,
                      onSubmitted: (address) => locationSearchController.onLocationSearch(address: address.trim()),
                    ),
                  ),
                  AnimatedContainer(
                    duration: BoneveraDurations.fadeAnimation,
                    curve: Curves.easeIn,
                    width: widget.locations.isNotEmpty ? 72 : 0,
                  ),
                ],
              ),

              ///
              /// SEARCH RESULTS
              ///
              // TODO: Finish UI for all states
              switch (locationSearchState) {
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
                Success() => LocationSearchSuccess(
                  location: (locationSearchState as Success).data,
                  onPressLocation: locationSearchController.locationPressed,
                ),
              },

              Expanded(
                child:
                    ///
                    /// LOCATIONS
                    ///
                    widget.locations.isNotEmpty
                    ? LocationsList(
                        locations: widget.locations,
                        locationPressed: (location) {
                          locationsController.updateCurrentLocation(
                            newCurrentLocation: location,
                          );

                          widget.drawerButtonPressed();
                        },
                        onReorder: locationsController.reorderLocations,
                        onTapDelete: (handler, location) {
                          handler(false);
                          locationsController.deleteLocation(location);
                        },
                      )
                    :
                      ///
                      /// NO LOCATIONS
                      ///
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 32),
                            Text(
                              'Add some locations'.toUpperCase(),
                              style: context.textStyles.locationsNoLocation,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
              ),
              const SizedBox(height: 16),

              ///
              /// BONEVERA LOGO & VERSION
              ///
              BoneveraVersionLogo(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:watch_it/watch_it.dart';

import '../../models/location/location.dart' as cjvnk_location;
import '../../services/logger_service.dart';
import '../../util/dependencies.dart';
import '../../util/state.dart';
import 'locations_controller.dart';

class LocationsScreen extends WatchingStatefulWidget {
  final List<cjvnk_location.Location> locations;
  final Color backgroundColor;

  const LocationsScreen({
    required this.locations,
    required this.backgroundColor,
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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          color: widget.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),

              ///
              /// SEARCH
              ///
              TextField(
                onSubmitted: (address) => getIt
                    .get<LocationsController>(
                      instanceName: 'locations',
                    )
                    .onLocationSearch(address: address.trim()),
              ),
              const SizedBox(height: 24),

              ///
              /// SEARCH RESULTS
              ///
              switch (locationsState) {
                Initial() => Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
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
                Success() => Text(
                  ((locationsState as Success).data as List<Placemark>).first.locality ?? 'no',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              },

              ///
              /// LOCATIONS
              ///
              Expanded(
                child: widget.locations.isNotEmpty
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.locations.length,
                        itemBuilder: (_, index) {
                          final location = widget.locations[index];

                          return ListTile(
                            title: Text(
                              location.locality,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            subtitle: Text(
                              location.country,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(height: 24),
                      )
                    : const Text(
                        'No locations',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

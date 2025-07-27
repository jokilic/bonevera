import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class LocationsSuccess extends StatelessWidget {
  final List<Placemark> locations;

  const LocationsSuccess({
    required this.locations,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    itemCount: locations.length,
    itemBuilder: (_, index) {
      final location = locations[index];

      return ListTile(
        title: Text(
          location.locality ?? '--',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        subtitle: Text(
          location.country ?? '--',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      );
    },
    separatorBuilder: (_, __) => const SizedBox(height: 24),
  );
}

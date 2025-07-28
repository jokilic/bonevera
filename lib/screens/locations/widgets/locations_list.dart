import 'package:flutter/material.dart';

import '../../../models/location/location.dart';
import '../../../theme/theme.dart';
import '../../../widgets/cjvnk_button.dart';

class LocationsList extends StatelessWidget {
  final List<Location> locations;
  final Function(Location location) locationPressed;

  const LocationsList({
    required this.locations,
    required this.locationPressed,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8),
      Text(
        'Locations'.toUpperCase(),
        style: context.textStyles.locationsTitle,
      ),
      Expanded(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: locations.length,
          itemBuilder: (_, index) {
            final location = locations[index];

            return CJVnkButton(
              onPressed: () => locationPressed(location),
              child: ListTile(
                title: Text(
                  location.locality,
                  style: context.textStyles.locationsName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  location.country,
                  style: context.textStyles.locationsCountry,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 8),
        ),
      ),
    ],
  );
}

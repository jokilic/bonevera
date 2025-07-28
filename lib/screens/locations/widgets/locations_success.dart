import 'package:flutter/material.dart';
import '../../../models/location/location.dart' as cjvnk_location;
import '../../../theme/theme.dart';
import '../../../widgets/cjvnk_button.dart';

class LocationsSuccess extends StatelessWidget {
  final List<cjvnk_location.Location> locations;
  final Function(cjvnk_location.Location location) onPressLocation;

  const LocationsSuccess({
    required this.locations,
    required this.onPressLocation,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: const EdgeInsets.symmetric(vertical: 12),
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    itemCount: locations.length,
    itemBuilder: (_, index) {
      final location = locations[index];

      return CJVnkButton(
        onPressed: () => onPressLocation(location),
        child: ListTile(
          title: Text(
            location.locality ?? '--',
            style: context.textStyles.locationsName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            location.country ?? '--',
            style: context.textStyles.locationsCountry,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 4),
        ),
      );
    },
    separatorBuilder: (_, __) => const SizedBox(height: 24),
  );
}

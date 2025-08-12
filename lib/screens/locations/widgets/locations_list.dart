import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';

import '../../../constants/durations.dart';
import '../../../models/location/location.dart';
import '../../../theme/icons.dart';
import '../../../theme/theme.dart';
import '../../../widgets/bonevera_button.dart';

class LocationsList extends StatelessWidget {
  final List<Location> locations;
  final Function(Location location) locationPressed;
  final Function(int oldIndex, int newIndex) onReorder;
  final Function(CompletionHandler handler, Location location) onTapDelete;

  const LocationsList({
    required this.locations,
    required this.locationPressed,
    required this.onReorder,
    required this.onTapDelete,
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
        child: ReorderableListView.builder(
          proxyDecorator: (child, index, animation) => Material(
            borderRadius: BorderRadius.circular(16),
            color: context.colors.locationsText,
            child: child,
          ),
          onReorder: (oldIndex, newIndex) {
            if (newIndex > oldIndex) {
              newIndex--;
            }

            onReorder(oldIndex, newIndex);
          },
          physics: const BouncingScrollPhysics(),
          itemCount: locations.length,
          itemBuilder: (_, index) {
            final location = locations[index];

            return Animate(
              key: ValueKey(location),
              delay: (BoneveraDurations.buttonAnimation.inMilliseconds * index).milliseconds,
              effects: const [
                FadeEffect(
                  curve: Curves.easeIn,
                  duration: BoneveraDurations.fadeAnimation,
                ),
              ],
              child: SwipeActionCell(
                key: ValueKey(location),
                openAnimationCurve: Curves.easeIn,
                closeAnimationCurve: Curves.easeIn,
                backgroundColor: Colors.transparent,
                trailingActions: [
                  SwipeAction(
                    onTap: (handler) => onTapDelete(handler, location),
                    color: Colors.transparent,
                    backgroundRadius: 100,
                    content: BoneveraButton(
                      child: IconButton(
                        onPressed: null,
                        padding: const EdgeInsets.all(12),
                        style: IconButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: context.colors.locationsText.withValues(alpha: 0.3),
                          disabledBackgroundColor: context.colors.locationsText.withValues(alpha: 0.3),
                          overlayColor: context.colors.locationsText,
                        ),
                        icon: Image.asset(
                          BoneveraIcons.delete,
                          height: 32,
                          width: 32,
                          color: context.colors.locationsText,
                        ),
                      ),
                    ),
                  ),
                ],
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: BoneveraButton(
                    onPressed: () => locationPressed(location),
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
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

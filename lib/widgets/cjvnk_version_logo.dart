import 'package:flutter/material.dart';

import '../theme/icons.dart';
import '../theme/theme.dart';
import '../util/app_version.dart';
import 'cjvnk_button.dart';

class CJVnKVersionLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
    children: [
      CJVnkButton(
        onLongPressed: () {},
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(
              color: context.colors.locationsText,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipOval(
            child: Image.asset(
              CJVnkIcons.sun,
              height: 48,
              width: 48,
            ),
          ),
        ),
      ),
      const SizedBox(width: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ča ima vanka?',
            style: context.textStyles.locationsAppName,
          ),
          FutureBuilder(
            future: getAppVersion(),
            builder: (_, snapshot) {
              final version = snapshot.data;

              if (version != null) {
                return Text(
                  'v$version',
                  style: context.textStyles.locationsAppVersion,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    ],
  );
}

import 'package:flutter/material.dart';

import '../../../../theme/theme.dart';

class LocationSearchField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String address) onSubmitted;

  const LocationSearchField({
    required this.textEditingController,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) => TextField(
    controller: textEditingController,
    keyboardType: TextInputType.streetAddress,
    textCapitalization: TextCapitalization.words,
    textInputAction: TextInputAction.search,
    style: context.textStyles.locationsTextField,
    cursorColor: context.colors.locationsText,
    cursorWidth: 2.5,
    cursorHeight: 28,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 8,
      ),
      hintText: 'Search...',
      hintStyle: context.textStyles.locationsTextField,
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: context.colors.locationsText,
          width: 2.5,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: context.colors.locationsText,
          width: 2.5,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: context.colors.locationsText,
          width: 2.5,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: context.colors.locationsText,
          width: 2.5,
        ),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: context.colors.locationsText,
          width: 2.5,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: context.colors.locationsText,
          width: 2.5,
        ),
      ),
    ),
    onSubmitted: onSubmitted,
  );
}

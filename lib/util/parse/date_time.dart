import 'package:intl/intl.dart';

import '../../models/day.dart';
import '../../models/hour.dart';

/// Returns properly formatted date, e.g. `Today` or `Monday`
String getFormattedDate({
  required DateTime forecastStart,
  required DateTime forecastEnd,
}) {
  /// Current date and time
  final now = DateTime.now().toUtc();

  /// Get `UTC` versions of passed forecast [DateTimes]
  final forecastStartUtc = forecastStart.toUtc();
  final forecastEndUtc = forecastEnd.toUtc();

  /// Today
  if (now.isAfter(forecastStartUtc) && now.isBefore(forecastEndUtc)) {
    return 'Today';
  }

  /// Convert to local date for display
  final localDate = forecastStartUtc.toLocal();
  return DateFormat('EEEE').format(localDate);
}

/// Returns properly formatted time, e.g. `12:00`
String getFormattedTime(DateTime dateTime) => DateFormat.Hm().format(dateTime);

/// Returns current [Day] from [List<Day>]
Day? getCurrentDay(List<Day>? days) {
  final now = DateTime.now().toUtc();

  try {
    return days?.firstWhere(
      (day) => now.isAfter(day.forecastStart) && now.isBefore(day.forecastEnd),
    );
  } catch (_) {
    return null;
  }
}

/// Returns all [Days] from [List<Day>] except the current `day`
List<Day>? getDaysExceptToday(List<Day>? days) {
  final now = DateTime.now().toUtc();

  if (days == null) {
    return [];
  }

  try {
    return days
        .where(
          (day) => now.isBefore(day.forecastStart) || now.isAfter(day.forecastEnd),
        )
        .toList();
  } catch (e) {
    return null;
  }
}

/// Returns the first 24 hours from passed `List<Hour>`
List<Hour> getNext24Hours({required List<Hour>? allHours}) {
  if (allHours?.isNotEmpty ?? false) {
    /// Current date and time
    final now = DateTime.now();

    /// Sort the list in case it's not already sorted
    allHours!.sort(
      (a, b) => a.forecastStart.compareTo(b.forecastStart),
    );

    /// Find the first hour that is >= now
    final startIndex = allHours.indexWhere(
      (hour) => hour.forecastStart.isAfter(now) || hour.forecastStart.isAtSameMomentAs(now),
    );

    if (startIndex == -1) {
      return [];
    }

    /// Take 24 from that point
    return allHours.skip(startIndex).take(24).toList();
  }

  return [];
}

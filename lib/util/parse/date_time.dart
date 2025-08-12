import 'package:intl/intl.dart';

import '../../models/day.dart';
import '../../models/hour.dart';

/// Returns properly formatted date, e.g. `Today` or `Monday`
String getFormattedDate({
  required DateTime forecastStart,
  DateTime? forecastEnd,
}) {
  /// Current date and time
  final now = DateTime.now().toLocal();

  /// Get `local` versions of passed forecast [DateTimes]
  final forecastStartLocal = forecastStart.toLocal();
  final forecastEndLocal = forecastEnd?.toLocal();

  /// Today
  if (now.isAfter(forecastStartLocal) && (forecastEndLocal == null || now.isBefore(forecastEndLocal))) {
    return 'Today';
  }

  /// Convert to local date for display
  final localDate = forecastStartLocal.toLocal();
  return DateFormat('EEEE').format(localDate);
}

/// Returns properly formatted time, e.g. `12:00`
String getFormattedTime(DateTime dateTime) => DateFormat.Hm().format(dateTime);

/// Returns current [Day] from [List<Day>]
Day? getCurrentDay(List<Day>? days) {
  final now = DateTime.now().toLocal();

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
  final now = DateTime.now().toLocal();

  if (days == null) {
    return [];
  }

  try {
    return days
        .where(
          (day) => now.isBefore(day.forecastStart) || now.isAfter(day.forecastEnd),
        )
        .toList();
  } catch (_) {
    return null;
  }
}

/// Returns the next 24 hours from the given `startTime`
List<Hour> get24HoursFromDateTime({
  required List<Hour>? allHours,
  required DateTime startTime,
}) {
  if (allHours?.isNotEmpty ?? false) {
    /// Sort the list just in case
    allHours!.sort(
      (a, b) => a.forecastStart.compareTo(b.forecastStart),
    );

    /// Use [DateTime] starting at midnight
    final dayStart = DateTime(
      startTime.year,
      startTime.month,
      startTime.day,
    );

    /// Find the first hour that is >= `dayStart`
    final startIndex = allHours.indexWhere(
      (hour) {
        /// Create [DateTime] starting at midnight
        final hourStart = DateTime(
          hour.forecastStart.year,
          hour.forecastStart.month,
          hour.forecastStart.day,
        );

        return !hourStart.isBefore(dayStart);
      },
    );

    if (startIndex == -1) {
      return [];
    }

    /// Return the next 24 hours from that point
    return allHours.skip(startIndex).take(24).toList();
  }

  return [];
}

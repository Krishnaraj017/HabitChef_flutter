
// Extension method on TimeOfDay for easy conversion
import 'package:flutter/material.dart';

extension TimeOfDayConverter on TimeOfDay {
  DateTime toDateTime([DateTime? date]) {
    final now = date ?? DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
  }

  // Convert to today's date at this time
  DateTime toDateTimeToday() {
    final now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
  }

  // Convert to tomorrow's date at this time
  DateTime toDateTimeTomorrow() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return DateTime(
      tomorrow.year,
      tomorrow.month,
      tomorrow.day,
      hour,
      minute,
    );
  }

  // Convert to next occurrence of this time
  DateTime toNextOccurrence() {
    final now = DateTime.now();
    final todayAtTime = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // If the time has already passed today, return tomorrow's occurrence
    if (todayAtTime.isBefore(now)) {
      return todayAtTime.add(const Duration(days: 1));
    }

    return todayAtTime;
  }
}

// Example usage:
void example() {
  final TimeOfDay time = TimeOfDay(hour: 14, minute: 30); // 2:30 PM

  // Basic conversion to today's date
  final DateTime dateTime1 = time.toDateTime();

  // Convert to a specific date
  final DateTime specificDate = DateTime(2025, 1, 1);
  final DateTime dateTime2 = time.toDateTime(specificDate);

  // Get next occurrence
  final DateTime nextOccurrence = time.toNextOccurrence();

  // Get tomorrow's occurrence
  final DateTime tomorrowTime = time.toDateTimeTomorrow();
}

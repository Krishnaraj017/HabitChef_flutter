import 'package:equatable/equatable.dart';

class HabitStatsState extends Equatable {
  const HabitStatsState();

  @override
  List<Object?> get props => [];
}

class HabitStatsSuccess extends HabitStatsState {
  final int totalHabitsToday;
  final int completedHabitsToday;
  final double successRateToday;
  final String? errorMessage;

  const HabitStatsSuccess({
    this.totalHabitsToday = 0,
    this.completedHabitsToday = 0,
    this.successRateToday = 0.0,
    this.errorMessage,
  });

  HabitStatsSuccess copyWith({
    int? totalHabitsToday,
    int? completedHabitsToday,
    double? successRateToday,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HabitStatsSuccess(
      totalHabitsToday: totalHabitsToday ?? this.totalHabitsToday,
      completedHabitsToday: completedHabitsToday ?? this.completedHabitsToday,
      successRateToday: successRateToday ?? this.successRateToday,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [totalHabitsToday, completedHabitsToday, successRateToday, errorMessage];
}

class HabitStatsErrorState extends HabitStatsState {
  const HabitStatsErrorState();
  @override
  List<Object?> get props => [];
}

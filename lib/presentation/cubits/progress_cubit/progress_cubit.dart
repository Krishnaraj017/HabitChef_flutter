import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitchef/data/models/habit.dart';
import 'package:habitchef/presentation/cubits/progress_cubit/progress_state.dart';

class HabitStatsCubit extends Cubit<HabitStatsState> {
  HabitStatsCubit() : super(const HabitStatsState());

  // Fetch habit statistics for the current day
  Future<void> fetchTodayStats() async {
    try {
      final stats = await HabitDatabase.instance.getHabitStatistics();

      emit(HabitStatsSuccess(
        totalHabitsToday: stats['totalHabitsToday'],
        completedHabitsToday: stats['completedHabitsToday'],
        successRateToday: stats['successRateToday'],
      ));
    } catch (e) {
      emit(HabitStatsErrorState());
    }
  }
}

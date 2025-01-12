import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitchef/data/models/habit.dart';
import 'package:habitchef/presentation/cubits/get_added_habits_cubit/get_added_habit_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAddedHabitsCubit extends Cubit<GetAddedHabitState> {
  GetAddedHabitsCubit() : super(GetAddedHabitInitial());

  void getAllAddedHabits() async {
    final habits = await HabitDatabase.instance.getHabitsByDate(DateTime.now());
    print(habits);
    if (habits.isEmpty) {
      print("pass++");
      emit(GetAddedHabitIsEmpty());
      print("emitted");
    } else {
      emit(GetAddedHabitSuccess(habits));
    }
  }

  void markHabitAsDone({required int id}) async {
    // Mark habit as done
    await HabitDatabase.instance.toggleHabitStatus(id);
  }
}

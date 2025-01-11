import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitchef/data/models/habit.dart';
import 'package:habitchef/presentation/cubits/add_habit_cubit/add_habit_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddHabitCubit extends Cubit<AddHabitCubitState> {
  AddHabitCubit() : super(AddHabitCubitInitial());

  void addHabit({required String title, required DateTime time}) async {
    // Add habit to database
    print("Adding habit to database");
    print(title);
    await HabitDatabase.instance.addHabit(title, time);

    emit(AddHabitCubitSuccess());
  }
}

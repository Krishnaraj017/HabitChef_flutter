import 'package:equatable/equatable.dart';
import 'package:habitchef/data/models/habit.dart';

abstract class GetAddedHabitState extends Equatable {
  const GetAddedHabitState();

  @override
  List<Object> get props => [];
}

class GetAddedHabitInitial extends GetAddedHabitState {
  const GetAddedHabitInitial();
  @override
  List<Object> get props => [];
}

class GetAddedHabitSuccess extends GetAddedHabitState {
  final List<HabitModel> habits;
  const GetAddedHabitSuccess(this.habits);
  @override
  List<Object> get props => [habits];
}

class GetAddedHabitError extends GetAddedHabitState {
  final String message;
  const GetAddedHabitError(this.message);
  @override
  List<Object> get props => [message];
}

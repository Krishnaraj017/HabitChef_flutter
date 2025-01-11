import 'package:equatable/equatable.dart';

abstract class AddHabitCubitState extends Equatable {
  const AddHabitCubitState();

  @override
  List<Object> get props => [];
}

class AddHabitCubitInitial extends AddHabitCubitState {
  const AddHabitCubitInitial();
  @override
  List<Object> get props => [];
}

class AddHabitCubitSuccess extends AddHabitCubitState {
  const AddHabitCubitSuccess();
  @override
  List<Object> get props => [];
}

class AddHabitCubitError extends AddHabitCubitState {
  final String message;
  const AddHabitCubitError(this.message);
  @override
  List<Object> get props => [message];
}

import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
  @override
  List<Object> get props => [];
}

class UserLoaded extends HomeState {
  final String userName;
  const UserLoaded(this.userName);
  @override
  List<Object> get props => [userName];
}
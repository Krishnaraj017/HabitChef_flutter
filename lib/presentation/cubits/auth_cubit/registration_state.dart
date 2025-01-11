import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {
  const RegistrationInitial();
  @override
  List<Object> get props => [];
}

class RegistrationLoading extends RegistrationState {
  const RegistrationLoading();
  @override
  List<Object> get props => [];
}

class RegistrationSuccess extends RegistrationState {
  const RegistrationSuccess();
  @override
  List<Object> get props => [];
}

class RegistrationFailedState extends RegistrationState {
  const RegistrationFailedState();
  @override
  List<Object> get props => [];
}

class LoginFailedState extends RegistrationState {
  const LoginFailedState();
  @override
  List<Object> get props => [];
}

class LoginSuccess extends RegistrationState {
  const LoginSuccess();
  @override
  List<Object> get props => [];
}

class UserLoggedInState extends RegistrationState {
  const UserLoggedInState();
  @override
  List<Object> get props => [];
}

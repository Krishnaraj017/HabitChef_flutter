import 'package:bloc/bloc.dart';
import 'package:habitchef/domain/entities/params/login_params.dart';
import 'package:habitchef/domain/entities/params/registration_params.dart';
import 'package:habitchef/domain/repositories/user_repository.dart';
import 'package:habitchef/presentation/cubits/auth_cubit/registration_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> {
  final UserRepository _userRepository;
  RegistrationCubit(this._userRepository) : super(RegistrationInitial());
  Future<void> register({email, loginPassword, userName}) async {
    emit(RegistrationLoading());
    try {
      final res = await _userRepository.registerUser(
          params: RegistrationParams(
        email: email,
        password: loginPassword,
        username: userName,
      ).toJson());
      print(res);
      res.fold(
        (l) => emit(RegistrationFailedState()),
        (r) => emit(RegistrationSuccess()),
      );
    } catch (e) {
      emit(RegistrationFailedState());
    }
  }

  Future<void> login({email, loginPassword}) async {
    emit(RegistrationLoading());
    try {
      print(email);
      print(loginPassword);
      final res = await _userRepository.login(
          params: EmailLoginParams(
        email: email,
        loginPassword: loginPassword,
      ).toJson());
      print(res);
      res.fold(
        (l) => emit(LoginFailedState()),
        (r) => emit(LoginSuccess()),
      );
    } catch (e) {
      emit(LoginFailedState());
    }
  }

  Future<bool> checkIfUserIsLoggedIn() async {
    print("calling");
    var res = await _userRepository.isUserLoggedIn();
    print(res);
    if (res) {
      print(res);
      emit(UserLoggedInState());
    }
    return res;
  }

 
}

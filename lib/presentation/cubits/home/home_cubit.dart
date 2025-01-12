import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitchef/domain/repositories/user_repository.dart';
import 'package:habitchef/presentation/cubits/home/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final UserRepository _userRepository;

  HomeCubit(this._userRepository) : super(HomeInitial());

  Future<String?> getUser() async {
    var res = await _userRepository.getUser();
    emit(UserLoaded(res??''));
    return res;
  }
}

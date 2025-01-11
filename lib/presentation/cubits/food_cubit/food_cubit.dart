import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitchef/presentation/cubits/food_cubit/food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  void loadFood() {
    emit(FoodLoading());
    
  }
}

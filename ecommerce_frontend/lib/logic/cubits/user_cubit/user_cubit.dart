import 'package:ecommerce_frontend/data/repositories/user_repository.dart';
import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserIntialState());

  final UserRepository _userRepository = UserRepository();

  void signIn({required String email, required String password}) async {
    emit(UserLoadingState());
    try {
      UserModel userModel =
          await _userRepository.signIn(email: email, password: password);
      emit(UserLoggedInState(userModel));
    } catch (ex) {
      emit(UserErrorState(ex.toString()));
    }
  }

  void createAccount({required String email, required String password}) async {
    emit(UserLoadingState());
    try {
      UserModel userModel =
          await _userRepository.createAccount(email: email, password: password);
      emit(UserLoggedInState(userModel));
    } catch (ex) {
      emit(UserErrorState(ex.toString()));
    }
  }
}

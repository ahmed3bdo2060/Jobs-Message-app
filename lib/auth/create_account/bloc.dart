import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs/auth/create_account/events.dart';
import 'package:jobs/auth/create_account/state.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvents, CreateAccountStates> {
  final DioHelper _dio;
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  CreateAccountBloc(this._dio) : super(CreateAccountStates()) {
    on<CreateAccountEvent>(_send);
  }

  Future<void> _send(
      CreateAccountEvent event, Emitter<CreateAccountStates> emit) async {
    if (formKey.currentState!.validate()) {
      emit(CreatAccountLoadingState());

      final response = await _dio.postCall2("/auth/register", data: {
        "name": userNameController.text,
        "password": passwordController.text,
        "email": emailController.text,
      });
      response.fold((left) {
        emit(CreateAccountFailedState(left.msg));
      }, (right) {
        emit(CreatAccountSuccessState());
      });
    }
  }
}

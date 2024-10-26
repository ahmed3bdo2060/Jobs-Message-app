import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs/auth/create_account/events.dart';
import 'package:jobs/auth/create_account/state.dart';
import 'package:jobs/auth/login/state.dart';
import 'package:jobs/core/logic/cash_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
import 'events.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final DioHelper _dio;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginBloc(this._dio) : super(LoginStates()) {
    on<LoginEvent>(_send);
  }

  Future<void> _send(LoginEvent event, Emitter<LoginStates> emit) async {
    emit(LoginLoadingState());
    final response = await _dio.postCall3("/auth/login", data: {
      "email": emailController.text,
      "password": passwordController.text,
    });
    response.fold((left) {
      String message = "failed";
      if (left is Map && left.containsKey('email')) {
        message = left['email'].first;
      } else if (left is String) {
        message = left;
      }
      emit(LoginFailedState(message));
    }, (right) {
      CashHelper.setUserName(response.right["user"]["name"]);
      CashHelper.userName;
      CashHelper.setUserToken(response.right["token"]);
      CashHelper.token;
      CashHelper.setUserEmail(response.right["user"]["email"]);
      CashHelper.email;
      CashHelper.setUserId(response.right["user"]["id"]);
      CashHelper.id;
      CashHelper.setUserCreatedAt(response.right["user"]["created_at"]);
      CashHelper.createdAt;
      CashHelper.setUserUpdatedAt(response.right["user"]["updated_at"]);
      CashHelper.updatedAt;
      emit(LoginSuccessState());
    });
  }

}

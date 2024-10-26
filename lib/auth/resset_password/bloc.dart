import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs/auth/create_account/events.dart';
import 'package:jobs/auth/create_account/state.dart';
import 'package:jobs/auth/login/state.dart';
import 'package:jobs/auth/resset_password/state.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
import 'events.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvents,ResetPasswordStates>{
  final DioHelper _dio;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  ResetPasswordBloc(this._dio):super(ResetPasswordStates()){
    on<ResetPasswordEvent>(_send);
  }

  Future<void> _send(ResetPasswordEvent event, Emitter<ResetPasswordStates> emit) async{
    try {
        emit(ResetPasswordLoadingState());
        final response = await _dio.send("/auth/user/update", data: {
          "name": userNameController.text,
          "password": passwordController.text,
        });
        if(response.isSuccess){
          showMessage(response.msg??"success",messageType: MessageType.Success);
          emit(ResetPasswordSuccessState());
        }else{
          showMessage(response.msg??"failed");
          emit(ResetPasswordFailedState());
        }
      }
    on LoginException catch(error){
      showMessage(error.message);
      emit(ResetPasswordFailedState());
    }on NetworkException catch(_){
      showMessage("Check your connection");
      emit(ResetPasswordFailedState());
    }

  }
}
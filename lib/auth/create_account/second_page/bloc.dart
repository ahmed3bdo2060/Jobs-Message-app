import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs/auth/create_account/second_page/events.dart';
import 'package:jobs/auth/create_account/second_page/states.dart';

import '../../../core/logic/dio_helper.dart';

class SecondCreateBloc extends Bloc<SecondCreateEvents, SecondCreateStates> {
  final DioHelper _dio;
  List<String> interestWork=[];

  SecondCreateBloc(this._dio,) : super(SecondCreateStates()) {
    on<SecondCreateEvent>(_put);
    on<SecondCreateAddEvent>(_add);
    on<SecondCreateRemoveEvent>(_remove);
  }

  Future<void> _put(
      SecondCreateEvent event, Emitter<SecondCreateStates> emit) async {
    emit(SecondCreateLoadingState());
    final response = await _dio.put(
        "/user/profile/edit",
        query: {"interested_work": interestWork});
    response.fold((left) => emit(SecondCreateFailedState(left.msg)),
        (right) {
          emit(SecondCreateSuccessState());
        });
  }

  Future<void> _add(SecondCreateAddEvent event, Emitter<SecondCreateStates> emit)async {
    interestWork.add(event.model.job);
  }

  Future<void> _remove(SecondCreateRemoveEvent event, Emitter<SecondCreateStates> emit)async {
    interestWork.remove(event.model.job);
  }
}

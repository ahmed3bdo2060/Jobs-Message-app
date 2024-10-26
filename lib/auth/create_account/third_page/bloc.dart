import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs/auth/create_account/third_page/events.dart';
import 'package:jobs/auth/create_account/third_page/states.dart';

import '../../../core/logic/dio_helper.dart';

class ThirdCreateBloc extends Bloc<ThirdCreateEvents,ThirdCreateStates>{
  final DioHelper _dio;
  List<String> ofInterestContries=[];
  List<String> reInterestContries=[];
  ThirdCreateBloc(this._dio) : super(ThirdCreateStates()){
  on<ThirdCreateEvent>(_put);
  on<ThirdCreateAddRemoteEvent>(_add);
  on<ThirdCreateRemoveRemoteEvent>(_remove);
  on<ThirdCreateRemoveOflineEvent>(_removeOf);
  on<ThirdCreateAddOflineEvent>(_addOf);
  }

  Future<void> _put(ThirdCreateEvent event, Emitter<ThirdCreateStates> emit)async {
    emit(ThirdCreateLoadingState());
    final response = await _dio.put("/user/profile/edit",query: {
      "offline_place": ofInterestContries,
      "remote_place": reInterestContries,
    });
    response.fold((left) => emit(ThirdCreateFailedState(left.msg)),
            (right) => emit(ThirdCreateSuccessState()));
  }

  Future<void> _add(ThirdCreateAddRemoteEvent event, Emitter<ThirdCreateStates> emit)async {
    reInterestContries.add(event.model.title);
  }

  Future<void> _remove(ThirdCreateRemoveRemoteEvent event, Emitter<ThirdCreateStates> emit)async {
    reInterestContries.add(event.model.title);
  }

  Future<void> _removeOf(ThirdCreateRemoveOflineEvent event, Emitter<ThirdCreateStates> emit)async {
    ofInterestContries.add(event.model.title);
  }

  Future<void> _addOf(ThirdCreateAddOflineEvent event, Emitter<ThirdCreateStates> emit)async {
    ofInterestContries.add(event.model.title);
  }
}
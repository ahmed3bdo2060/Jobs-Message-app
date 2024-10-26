import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs/home_screens/pages/home_page/events.dart';
import 'package:jobs/home_screens/pages/home_page/jobs.dart';
import 'package:jobs/home_screens/pages/home_page/states.dart';

import '../../../core/logic/dio_helper.dart';

class HomePageBloc extends Bloc<HomePageEvents,HomePageStates>{
  final DioHelper _dio;
  HomePageBloc(this._dio) : super(HomePageState()) {
    on<HomePageEvent>(_send);
  }

  Future<void> _send(HomePageEvent event, Emitter<HomePageStates> emit)async {
    emit(HomePageLoadingState());
    final response = await _dio.get("/jobs");
    final model = jobsData.fromJson(response.data).list;
    if(response.isSuccess){
      emit(HomePageSuccessState(model!));
    }else{
      emit(HomePageFailedState(response.msg));
    }
    
  }
}
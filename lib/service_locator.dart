import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jobs/auth/create_account/bloc.dart';
import 'package:jobs/auth/create_account/second_page/bloc.dart';
import 'package:jobs/home_screens/pages/home_page/events.dart';

import 'auth/create_account/third_page/bloc.dart';
import 'auth/login/bloc.dart';
import 'auth/resset_password/bloc.dart';
import 'core/logic/dio_helper.dart';
import 'home_screens/pages/home_page/bloc.dart';


void initServiceLocator() {
  final container = GetIt.instance;
  container.registerSingleton(DioHelper());
  container.registerFactory(() => CreateAccountBloc(container<DioHelper>()));
  container.registerFactory(() => SecondCreateBloc(container<DioHelper>()));
  container.registerFactory(() => ThirdCreateBloc(container<DioHelper>()));
  container.registerFactory(() => LoginBloc(container<DioHelper>()));
  container.registerFactory(() => ResetPasswordBloc(container<DioHelper>()));
  container.registerFactory(() => HomePageBloc(container<DioHelper>())..add(HomePageEvent()));


}

import 'package:dio/dio.dart';
import 'package:quick_log/quick_log.dart';
import 'cash_helper.dart';
import 'package:either_dart/either.dart';
class NetworkException implements Exception{}
class LoginException implements Exception{
  final String message;

  LoginException(this.message);
}
class DioHelper{
  DioHelper(){
    _dio.interceptors.add(AppInterceptor());
  }

  final _dio = Dio(BaseOptions(baseUrl: "https://project2.amit-learning.com/api",
      headers: {
        "Accept":"application/json",
      }));
  Future<CustomResponse> get(String path,
      {Map<String, dynamic>? queryParameters}) async {

    try {
      if(path.isEmpty){
        await Future.delayed(Duration(seconds: 2));
        return CustomResponse(isSuccess: true);
      }else{
        final response = await _dio.get(
          path,
          queryParameters: queryParameters,
        );

        return CustomResponse(
          isSuccess: true,
          data: response.data,
          msg: response.data["message"],
        );
      }

    } on DioException catch (ex) {
      return _handleException(ex);
    }
  }
  Future<Either<dynamic,dynamic>> get2(String path,
      {Map<String, dynamic>? queryParameters})async {
    try {
      final response = await _dio.get(path,queryParameters: queryParameters);
      return Right(response.data);
    }
    on DioException catch(ex){
      return Left( ex.response?.data["massege"]??ex.response?.data["massege"]??ex.response?.data["message"]??ex.response?.data["massage"]??"Failed");
    }catch(ex){
      return const Left( "Try later, Something went wrong.");
    }
  }


  Future <CustomResponse> send(String path,{Map<String,dynamic>? data})async {
    try {
      if(path.isEmpty){
        await Future.delayed(Duration(seconds: 2));
        return CustomResponse(isSuccess: true);
      }else{
        final response = await _dio.post(path,data: data);
        return CustomResponse(isSuccess:true,data: response.data,msg: response.data["message"]);
      }

    }
    on DioException catch(ex){
      return _handleException(ex);
    }
  }

  Future <dynamic> postCall(String path,{Map<String,dynamic>? data})async {
    try {
        final response = await _dio.post(path,data: data);
        return response.data;
    }
    on DioException catch(ex){
     throw AppNetworkException( ex.response?.data["massege"]??ex.response?.data["message"]??ex.response?.data["massage"]);
    }catch(ex){
      throw AppNetworkException("Try later, Something went wrong.");
    }
  }
  Future<Either<AppNetworkException,dynamic>>put(String path,{Map<String,dynamic>? data,Map<String,dynamic>? query})async{
    try{
      final response = await _dio.put(path,data:data,
      queryParameters: query);
      return Right(response.data);
    }
    on DioException catch(ex){
      return Left(AppNetworkException(ex.response?.data["massege"]??ex.response?.data["message"]??ex.response?.data["massage"]));
    }
    catch(ex){
      return Left(AppNetworkException("Try later, Something went wrong."));
    }
  }

  Future<Either<AppNetworkException,dynamic>> postCall2(String path,{Map<String,dynamic>? data})async {
    try {
      final response = await _dio.post(path,data: data);
      return Right(response.data);
    }
    on DioException catch(ex){
      return Left(AppNetworkException( ex.response?.data["massege"]??ex.response?.data["massege"]??ex.response?.data["message"]??ex.response?.data["massage"]??"Failed"));
    }catch(ex){
      return Left( AppNetworkException("Try later, Something went wrong."));
    }
  }
  Future<Either<dynamic,dynamic>> postCall3(String path,{Map<String,dynamic>? data})async {
    try {
      final response = await _dio.post(path,data: data);
      return Right(response.data);
    }
    on DioException catch(ex){
      return Left( ex.response?.data["massege"]??ex.response?.data["massege"]??ex.response?.data["message"]??ex.response?.data["massage"]??"Failed");
    }catch(ex){
      return const Left( "Try later, Something went wrong.");
    }
  }

  CustomResponse _handleException(DioException ex) {
    return CustomResponse(
      isSuccess: false,
      msg: ex.response?.data["massege"]??ex.response?.data["massege"]??ex.response?.data["message"]??ex.response?.data["massage"],
    );
  }
}
class AppNetworkException implements Exception{

  final String msg;
  AppNetworkException(this.msg);
}
class CustomResponse {
  final bool isSuccess;
  final data;
  String? msg;

  CustomResponse({required this.isSuccess, this.data, this.msg}){
    msg = msg??data?["massege"]??data?["message"]??"Failed Try Again Later";
  }
}
class AppInterceptor extends Interceptor{

  final log = Logger('');
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    log.fine("OnRequest");
    log.info("(${options.method})${options.baseUrl}${options.path}");
    log.fine("Data");
    log.fine(options.data);
    log.fine("QuaryParameters");
    log.fine(options.queryParameters);
    options.headers.addAll({"Authorization":"Bearer ${CashHelper.token}"});
    log.fine("*"*30);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    log.error("OnError");
    // log.error(err.response?.data["massege"]["email"].first??err.message);
    log.error("*"*30);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    log.fine("OnResponse");
    log.fine(response.data);
    log.fine("*"*30);
  }
}
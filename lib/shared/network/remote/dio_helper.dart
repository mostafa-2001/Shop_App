import 'package:dio/dio.dart';

class Dio_helper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        ));
  }

  static Future<Response> getdata(
      {required String path,
       Map<String, dynamic>? querys,
      String lang = 'en',
        dynamic token

      }) async {
    dio.options.headers = {'lang': lang,'Authorization': token??'', 'Content-Type':'application/json'};
    return await dio.get(path, queryParameters: querys);
  }

  static Future<Response> postdata(
      {required String path,
      Map<String, dynamic>? querys,
      required Map<String, dynamic> data,
      String lang = 'en',
        dynamic token
      }) async {
    dio.options.headers = {'lang': lang,'Authorization': token??'','Content-Type':'application/json'};
    return dio.post(path, queryParameters: querys, data: data);
  }

  static Future<Response> putdata(
      {required String path,
        Map<String, dynamic>? querys,
        required Map<String, dynamic> data,
        String lang = 'en',
        dynamic token
      }) async {
    dio.options.headers = {'lang': lang,'Authorization': token??'','Content-Type':'application/json'};
    return dio.put(path, queryParameters: querys, data: data);
  }

}

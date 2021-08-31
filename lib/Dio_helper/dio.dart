import 'package:dio/dio.dart';
import 'package:fitness_app/constans/strings.dart';

class DioHelper {
  static Dio? dio;

  static init() async {
    dio = Dio(BaseOptions(
      baseUrl: pathUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({required String path}) async {
    return await dio!.get(path).catchError((error) {
      print(error.toString());
    });
  }
}

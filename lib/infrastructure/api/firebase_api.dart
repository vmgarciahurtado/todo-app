import 'package:dio/dio.dart';

class Api {
  static final Dio _dio = Dio();

  static void configureDio() {
    //* Base url
    _dio.options.baseUrl =
        'https://us-central1-todoapp-4d633.cloudfunctions.net/app';
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } on DioError catch (e) {
      throw ('Error en el GET $e');
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);
      //return resp.data;
      return resp;
    } on DioError catch (e) {
      throw ('Error en el POST $e');
    }
  }

  static Future put(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      throw ('Error en el PUT $e');
    }
  }

  static Future delete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.delete(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      throw ('Error en el DELETE $e');
    }
  }
}

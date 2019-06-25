import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config.dart';

Dio dio = new Dio();

class PubModale {
  static httpRequest(method, url, [data]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      dio.options.headers['Authorization'] = prefs.getString('token') ?? '';
      Response response;
      switch (method) {
        case 'get':
          response = await dio.get(Config.baseUrl + url);
          break;
        case 'post':
          response = await dio.post(Config.baseUrl + url, data: data);
          break;
      }
      return response;
    } catch (e) {
      print(e);
    }
  }

  static checkuser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  static removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', '');
  }
}

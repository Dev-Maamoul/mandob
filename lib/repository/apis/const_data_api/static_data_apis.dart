import 'package:dio/dio.dart';

class StaticDataApis {
  final String baseUrl = 'https://dev-api-mqhf.onrender.com';
  final dio = Dio();

  StaticDataApis() {
    dio.options = BaseOptions(baseUrl: baseUrl, headers: {});
  }
}
//'https://cors-anywhere.herokuapp.com/https://your-api.com/data'
import 'package:company_project/layer_data/InitClass.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

class StaticDataApis {
  final String baseUrl = 'https://dev-api-mqhf.onrender.com';
  final dio = Dio();

  StaticDataApis() {
    dio.options = BaseOptions(baseUrl: baseUrl);
  }
}

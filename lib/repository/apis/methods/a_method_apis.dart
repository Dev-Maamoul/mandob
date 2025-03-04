
import 'package:company_project/models/analyzes_model.dart';
import 'package:company_project/models/auth_model.dart';
import 'package:company_project/models/driver_model.dart';
import 'package:company_project/models/login_model.dart';
import 'package:company_project/models/profile_model.dart';
import 'package:company_project/repository/apis/const_data_api/endpoint.dart';
import 'package:company_project/repository/apis/const_data_api/static_data_apis.dart';
import 'package:dio/dio.dart';

part './login_api.dart';
part './otp_api.dart';
part './get_profile.dart';
part './get_profile_analyzes.dart';
part './load_drivers.dart';
part './upload_drivers.dart';
part './update_profile.dart';
part './update_image_profile.dart';

class ApisMaamoul {
  final StaticDataApis _static = StaticDataApis();
  final EndpointApis _endpoint = EndpointApis();
}

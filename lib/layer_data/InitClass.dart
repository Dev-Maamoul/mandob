import 'dart:convert';

import 'package:company_project/models/auth_model.dart';
import 'package:company_project/models/login_model.dart';
import 'package:company_project/repository/apis/methods/a_method_apis.dart';
import 'package:get_storage/get_storage.dart';

class InitClass {
  final box = GetStorage();
  ApisMaamoul apis = ApisMaamoul();
  LoginModel? loginData;
  AuthModel? authData;

  Future<void> saveLoginData({required LoginModel loginData}) async {
    this.loginData = loginData;
    await box.write("login", jsonEncode(loginData.toJson()));
    await box.save();
  }

  Future<void> saveAuthData({required AuthModel authData}) async {
    this.authData = authData;
    await box.write("auth", jsonEncode(authData.toJson()));
    await box.save();
  }

  Future<void> loadData() async {
    print("*** -- Start load data Auth -- ***");
    try {
      if (box.hasData('auth')) {
        final authLoaded = jsonDecode(box.read("auth"));
        authData = AuthModel.fromJson(authLoaded);
      }
      if (box.hasData('login')) {
        final loginLoaded = jsonDecode(box.read("login"));
        loginData = LoginModel.fromJson(loginLoaded);
      }
    } catch (error) {
      print(error);
      throw FormatException(error.toString());
    }
  }

  clearData() async {
    loginData = null;
    authData = null;
    await box.erase();
    await box.save();
  }
}

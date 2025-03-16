import 'dart:developer';
import 'dart:async'; // Add this for runZonedGuarded

import 'package:bloc/bloc.dart';
import 'package:company_project/layer_data/init_class.dart';
import 'package:company_project/repository/apis/methods/a_method_apis.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _getIt = GetIt.I.get<InitClass>();
  String mobile = '';
  String otp = '';
  AuthCubit() : super(AuthInitialState());

  Future<void> login() async {
    await runZonedGuarded(() async {
      try {
        emit(LoadingLoginState());

        mobile = mobile.trim();
        mobile = mobile.replaceAll("+", "");

        if (mobile.isEmpty || mobile.length <= 4) {
          throw FormatException("Please enter a valid phone number");
        }

        final loginData = await _getIt.apis.loginMethod(mobile: mobile);
        await _getIt.saveLoginData(loginData: loginData);

        emit(SuccessLoginState());
      } on FormatException catch (error) {
        emit(ErrorState(text: error.message));
      } catch (error) {
        emit(ErrorState(text: "An unexpected error occurred: $error"));
      } 
    }, (error, stackTrace) {
      emit(ErrorState(text: "Unexpected error: $error"));
    });
  }

  Future<void> verifyOTP() async {
    try {
      emit(LoadingOTPState());
      final mobile = _getIt.loginData!.mobile;

      if (otp.trim().isEmpty || otp.length < 6) {
        throw FormatException("The OTP is not correct");
      }
      final authData = await _getIt.apis.otpVerifyMethod(
        mobile: mobile,
        otp: otp,
      );
      await _getIt.saveAuthData(authData: authData);
      emit(SuccessVerifyState());
    } on FormatException catch (error) {
      emit(ErrorState(text: error.message));
    } catch (error) {
      emit(ErrorState(text: error.toString()));
    }
  }
}
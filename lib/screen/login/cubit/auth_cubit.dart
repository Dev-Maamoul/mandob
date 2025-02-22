import 'package:bloc/bloc.dart';
import 'package:company_project/layer_data/InitClass.dart';
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
    try {
      emit(LoadingLoginState());

      mobile.replaceAll("+", "");
      if (mobile.trim().isEmpty) {
        throw FormatException("The phone not correct");
      }
      final loginData = await _getIt.apis.loginMethod(mobile: mobile);
      await _getIt.saveLoginData(loginData: loginData);

      emit(SuccessLoginState());
    } on FormatException catch (error) {
      emit(ErrorState(text: error.message));
    } catch (error) {
      emit(ErrorState(text: error.toString()));
    }
  }

  Future<void> verifyOTP() async {
    try {
      emit(LoadingOTPState());
      final mobile = _getIt.loginData!.mobile;

      if (otp.trim().isEmpty || otp.length < 6) {
        throw FormatException("The OTP not correct");
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

part of 'a_method_apis.dart';

extension OtpVerifyMethod on ApisMaamoul {
  Future<AuthModel> otpVerifyMethod({
    required String mobile,
    required String otp,
  }) async {
    try {
      final response = await _static.dio.post(
        _endpoint.verifyOTP,
        data: {"mobile": mobile, "otp": otp, "id_notification": "388394"},
        options: Options(
          headers: {
            "content-type":
                "application/json", // Specify content-type as JSON to prevent empty response body
          },
        ),
      );
      if (response.statusCode.toString().startsWith('20')) {
        return AuthModel.fromJson(response.data['data']);
      } else {
        throw FormatException(response.data['data']);
      }
    } on DioException catch (error) {
      throw FormatException(error.response?.data['message']);
    } on FormatException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
}

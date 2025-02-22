part of 'a_method_apis.dart';

extension LoginMethod on ApisMaamoul {
  Future<LoginModel> loginMethod({required String mobile}) async {
    try {
      print("Login Api");
      final response = await _static.dio.post(
        _endpoint.login,
        data: {"mobile": mobile},
        options: Options(
          headers: {
            "content-type":
                "application/json", // Specify content-type as JSON to prevent empty response body
          },
        ),
      );
      if (response.statusCode.toString().startsWith('20')) {
        return LoginModel.fromJson(response.data['data']);
      } else {
        throw FormatException(response.data['data']);
      }
    } on DioException catch (error) {
      print("000000");
      print(error.error);
      print(error.message);
      print(error.response);
      throw FormatException(error.response?.data['message']);
    } on FormatException catch (error) {
      print("111111");

      throw FormatException(error.message);
    } catch (error) {
      print(error);
      print("22222");

      throw FormatException(error.toString());
    }
  }
}

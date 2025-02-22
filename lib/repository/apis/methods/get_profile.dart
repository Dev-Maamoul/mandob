part of 'a_method_apis.dart';

extension GetProfileMethod on ApisMaamoul {
  Future<ProfileModel> getProfileMethod({required String token}) async {
    try {
      print("here is api ***");
      final response = await _static.dio.get(
        _endpoint.getProfile,
        options: Options(
          headers: {
            "authorization": "Bearer $token",
            "content-type":
                "application/json", // Specify content-type as JSON to prevent empty response body
          },
        ),
      );
      print(response.data['data']);
      if (response.statusCode.toString().startsWith('20')) {
        return ProfileModel.fromJson(response.data['data']);
      } else {
        throw FormatException(response.data["message"]);
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

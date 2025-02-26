part of 'a_method_apis.dart';

extension UpdateProfileMethod on ApisMaamoul {
  Future<ProfileModel> updateProfileMethod({
    required String token,
    required Map<String, dynamic> dataUpdate,
  }) async {
    try {
      final response = await _static.dio.put(
        _endpoint.updateProfile,
        data: dataUpdate,
        options: Options(
          headers: {
            "authorization": "Bearer $token",
            "content-type": "application/json",
          },
        ),
      );
      if (response.statusCode.toString().startsWith('20')) {
        return ProfileModel.fromJson(response.data['data']);
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

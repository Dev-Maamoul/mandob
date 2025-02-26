part of 'a_method_apis.dart';

extension UploadDriversMethod on ApisMaamoul {
  Future<void> uploadDriversMethod({
    required String token,
    required List<int> fileData,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"file": fileData};
      final response = await _static.dio.put(
        _endpoint.uploadDrivers,
        data: requestData,
        options: Options(
          headers: {
            "authorization": "Bearer $token",
            "content-type": "application/json",
          },
        ),
      );
      if (response.statusCode.toString().startsWith('20')) {
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

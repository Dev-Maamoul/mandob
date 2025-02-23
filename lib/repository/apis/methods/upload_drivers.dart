part of 'a_method_apis.dart';

extension UploadDriversMethod on ApisMaamoul {
  Future<void> uploadDriversMethod({
    required String token,
    required List<int> fileData,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        "file": fileData, // إرسال البيانات كما هي بدون MultipartFile
      };
      print(requestData);
      final response = await _static.dio.put(
        _endpoint.uploadDrivers,
        data: requestData,
        options: Options(
          headers: {
            "authorization": "Bearer $token",
            "content-type":
                "application/json", // Specify content-type as JSON to prevent empty response body
          },
        ),
      );
      if (response.statusCode.toString().startsWith('20')) {
      } else {
        throw FormatException(response.data['data']);
      }
    } on DioException catch (error) {
      print("1---${error.message}");
      print("1---${error.error}");
      print("1---${error.response?.data}");
      throw FormatException(error.response?.data['message']);
    } on FormatException catch (error) {
      print("2---$error");

      throw FormatException(error.message);
    } catch (error) {
      print("3---$error");

      throw FormatException(error.toString());
    }
  }
}

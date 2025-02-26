part of 'a_method_apis.dart';

extension UpdateImageProfileMethod on ApisMaamoul {
  Future<String> updateImageProfileMethod({
    required String token,
    required List<int> imageData,
  }) async {
    try {
      final response = await _static.dio.put(
        _endpoint.updateImage,
        data: {"image": imageData},
        options: Options(
          headers: {
            "authorization": "Bearer $token",
            "content-type": "application/json",
          },
        ),
      );
      if (response.statusCode.toString().startsWith('20')) {
        return response.data['data'];
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

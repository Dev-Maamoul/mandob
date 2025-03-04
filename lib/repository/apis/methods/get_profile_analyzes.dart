part of 'a_method_apis.dart';

extension GetAnalyzesMethod on ApisMaamoul {
  Future<AnalyzesModel> getAnalyzesMethod({required String token}) async {
    try {
      final response = await _static.dio.get(
        _endpoint.getAnalyzes,
        options: Options(
          headers: {
            "authorization": "Bearer $token",
            "content-type":
                "application/json", // Specify content-type as JSON to prevent empty response body
          },
        ),
      );
      if (response.statusCode.toString().startsWith('20')) {
        return AnalyzesModel.fromJson(response.data['data']);
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

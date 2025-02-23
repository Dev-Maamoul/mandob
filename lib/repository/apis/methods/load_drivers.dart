part of 'a_method_apis.dart';

extension LoadDriversMethod on ApisMaamoul {
  Future<List<DriverModel>> loadDriversMethod({required String token}) async {
    try {
      final response = await _static.dio.get(
        _endpoint.loadDrivers,
        options: Options(
          headers: {
            "authorization": "Bearer $token",

            "content-type":
                "application/json", // Specify content-type as JSON to prevent empty response body
          },
        ),
      );
      if (response.statusCode.toString().startsWith('20')) {
        final List<DriverModel> drivers =
            (response.data['data'] as List)
                .map((driver) => DriverModel.fromJson(driver))
                .toList();
        return drivers;
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

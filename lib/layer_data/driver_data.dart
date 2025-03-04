import 'package:company_project/layer_data/init_class.dart';
import 'package:company_project/models/driver_model.dart';
import 'package:company_project/repository/apis/methods/a_method_apis.dart';
import 'package:get_it/get_it.dart';

class DriversData {
  final _getIt = GetIt.I.get<InitClass>();

  List<DriverModel>? drivers = [];

  loadData() async {
    try {
      final driversLoaded = await _getIt.apis.loadDriversMethod(
        token: _getIt.authData!.token,
      );
      drivers!.clear();
      drivers!.addAll(driversLoaded);
    } on FormatException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  uploadDriver({required List<int> fileData}) async {
    try {
      await _getIt.apis.uploadDriversMethod(
        token: _getIt.authData!.token,
        fileData: fileData,
      );
    } on FormatException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
}

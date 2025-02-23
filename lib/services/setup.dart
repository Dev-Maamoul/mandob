import 'package:company_project/layer_data/InitClass.dart';
import 'package:company_project/layer_data/driver_data.dart';
import 'package:company_project/layer_data/profile_data.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

Future<void> setup() async {
  await GetStorage.init();
  GetIt.I.registerSingleton<InitClass>(InitClass());
  GetIt.I.registerSingleton<ProfileData>(ProfileData());
  GetIt.I.registerSingleton<DriversData>(DriversData());
}

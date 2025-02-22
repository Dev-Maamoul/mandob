import 'dart:convert';

import 'package:company_project/layer_data/InitClass.dart';
import 'package:company_project/models/profile_model.dart';
import 'package:company_project/repository/apis/methods/a_method_apis.dart';
import 'package:get_it/get_it.dart';

class ProfileData {
  final _getIt = GetIt.I.get<InitClass>();
  ProfileModel? profile;
  Future<void> saveProfile({required ProfileModel profile}) async {
    this.profile = profile;
    await _getIt.box.write("profile", jsonEncode(profile.toJson()));
    await _getIt.box.save();
  }

  Future<void> loadedProfile() async {
    print("99 ${_getIt.box.read('profile')}");
    if (_getIt.box.hasData('profile')) {
      print("-----1-----");

      final profileLoaded = jsonDecode(_getIt.box.read("profile").toString());
      profile = ProfileModel.fromJson(profileLoaded);
    } else {
      print("-----2-----");
      await getProfile();
    }
  }

  Future<void> getProfile() async {
    try {
      final profileGet = await _getIt.apis.getProfileMethod(
        token: _getIt.authData!.token,
      );
      final getAnalyzes = await _getIt.apis.getAnalyzesMethod(
        token: _getIt.authData!.token,
      );
      ProfileModel profileForSave = profileGet;
      profileForSave.analyzes = getAnalyzes;
      await saveProfile(profile: profileGet);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
}

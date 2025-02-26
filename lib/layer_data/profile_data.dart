import 'dart:convert';

import 'package:company_project/layer_data/InitClass.dart';
import 'package:company_project/models/analyzes_model.dart';
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

  Future<void> loadedProfile({bool? loadOnline}) async {
    if (loadOnline != true) {
      if (_getIt.box.hasData('profile')) {
        final profileLoaded = jsonDecode(_getIt.box.read("profile").toString());
        profile = ProfileModel.fromJson(profileLoaded);
      } else {
        final load = <Future>[getProfile(), getAnalyzes()];
        final dataLoaded = await Future.wait(load, eagerError: true);

        ProfileModel profileData = dataLoaded[0];
        profileData.analyzes = dataLoaded[1];

        await saveProfile(profile: profileData);
      }
    } else {
      await loadFromURL();
    }
  }

  loadFromURL() async {
    try {
      final load = <Future>[getProfile(), getAnalyzes()];
      final dataLoaded = await Future.wait(load);

      ProfileModel profileData = dataLoaded[0];
      profileData.analyzes = dataLoaded[1];

      await saveProfile(profile: profileData);
    } catch (error) {
      print(error);
    }
  }

  Future<ProfileModel> getProfile() async {
    try {
      final profileGet = await _getIt.apis.getProfileMethod(
        token: _getIt.authData!.token,
      );

      return profileGet;
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  Future<AnalyzesModel> getAnalyzes() async {
    try {
      final getAnalyzes = await _getIt.apis.getAnalyzesMethod(
        token: _getIt.authData!.token,
      );
      return getAnalyzes;
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  Future<void> updateProfile({required Map<String, dynamic> dataUpdate}) async {
    try {
      profile = await _getIt.apis.updateProfileMethod(
        token: _getIt.authData!.token,
        dataUpdate: dataUpdate,
      );

      await _getIt.box.write("profile", jsonEncode(profile!.toJson()));
      await _getIt.box.save();
      await loadedProfile(loadOnline: true);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  Future<void> updateImage({required List<int> dataUpdate}) async {
    try {
      final String url = await _getIt.apis.updateImageProfileMethod(
        token: _getIt.authData!.token,
        imageData: dataUpdate,
      );

      profile?.logoUrl = url;

      await _getIt.box.write("profile", jsonEncode(profile!.toJson()));
      await _getIt.box.save();
      await loadedProfile(loadOnline: true);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
}

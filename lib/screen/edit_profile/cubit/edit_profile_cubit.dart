import 'package:bloc/bloc.dart';
import 'package:company_project/layer_data/profile_data.dart';
import 'package:company_project/utils/methods/loaded_image_url.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  Uint8List? image;
  bool isChangeImage = false;
  final profile = GetIt.I.get<ProfileData>();
  EditProfileCubit() : super(EditProfileInitial());

  loadData() async {
    image = await loadedImageURL(imageURL: profile.profile?.logoUrl);
    emit(SuccessStateInit());
  }

  changeImage({required Uint8List imageData}) async {
    image = imageData;
    isChangeImage = true;
    emit(SuccessChangeImageStateInit());
  }

  dataUpdate({required CompanyModel newData}) async {
    try {
      emit(LoadedUpdateStateInit());
      final Map<String, dynamic> data = {};
      bool updateData = false;
      final oldData = profile.profile;
      if (newData.fullName != oldData?.companyName) {
        data["full_name"] = newData.fullName;
        updateData = true;
      }
      if (newData.commercial != oldData?.commercialId) {
        data["commercial"] = newData.commercial;
        updateData = true;
      }
      if (newData.establishmentNumber != oldData?.establishmentId) {
        data["establishment_number"] = newData.establishmentNumber;
        updateData = true;
      }
      final update = <Future>[];
      if (isChangeImage && updateData) {
        update.add(profile.updateImage(dataUpdate: image!.toList()));
        update.add(profile.updateProfile(dataUpdate: data));
      } else if (isChangeImage) {
        update.add(profile.updateImage(dataUpdate: image!.toList()));
      } else {
        update.add(profile.updateProfile(dataUpdate: data));
      }
      await Future.wait(update);
      // emit(SuccessChangeImageStateInit());
      emit(SuccessUpdateStateInit());
    } catch (error) {
      emit(ErrorState());
    }
  }
}

class CompanyModel {
  CompanyModel({this.fullName, this.commercial, this.establishmentNumber});
  String? id;
  String? fullName;
  String? commercial;
  String? establishmentNumber;

  CompanyModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];

    commercial = json['commercial'];
    establishmentNumber = json['establishment_number'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['company_name'] = fullName;
    data['commercial_id'] = commercial;
    data['establishment_id'] = establishmentNumber;
    data.removeWhere((key, value) => value == null);
    return data;
  }
}

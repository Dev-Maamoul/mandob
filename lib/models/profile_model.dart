import 'package:company_project/models/analyzes_model.dart';

class ProfileModel {
  ProfileModel({
    required this.id,
    required this.companyName,
    required this.commercialId,
    required this.establishmentId,
    required this.mobile,
    required this.email,
    required this.logoUrl,
    required this.authId,
    required this.idNotification,
    required this.createdAt,
  });
  late final String id;
  String? companyName;
  String? commercialId;
  String? establishmentId;
  String? mobile;
  String? email;
  String? logoUrl;
  String? authId;
  String? idNotification;
  String? createdAt;
  AnalyzesModel? analyzes;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    commercialId = json['commercial_id'];
    establishmentId = json['establishment_id'];
    mobile = json['mobile'];
    email = json['email'];
    logoUrl = json['logo_url'];
    authId = json['auth_id'];
    idNotification = json['id_notification'];
    createdAt = json['created_at'];
    analyzes =
        json['analyzes'] != null
            ? AnalyzesModel.fromJson(json['analyzes'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['commercial_id'] = commercialId;
    data['establishment_id'] = establishmentId;
    data['mobile'] = mobile;
    data['email'] = email;
    data['logo_url'] = logoUrl;
    data['auth_id'] = authId;
    data['id_notification'] = idNotification;
    data['created_at'] = createdAt;
    data['analyzes'] = analyzes;
    return data;
  }
}

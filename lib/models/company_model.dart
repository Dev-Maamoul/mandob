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

class Company {
  Company({
    required this.id,
    required this.email,
    required this.mobile,
    required this.logoUrl,
    required this.companyName,
  });
  String? id;
  String? email;
  String? mobile;
  String? logoUrl;
  String? companyName;

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    mobile = json['mobile'];
    logoUrl = json['logo_url'];
    companyName = json['company_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['mobile'] = mobile;
    data['logo_url'] = logoUrl;
    data['company_name'] = companyName;
    return data;
  }
}

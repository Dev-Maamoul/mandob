class StaticCities {
  StaticCities({
    required this.cityAr,
    required this.cityEn,
    required this.cityId,
    required this.regionAr,
    required this.regionEn,
  });
  String? cityAr;
  String? cityEn;
  String? cityId;
  String? regionAr;
  String? regionEn;

  StaticCities.fromJson(Map<String, dynamic> json) {
    cityAr = json['city_ar'];
    cityEn = json['city_en'];
    cityId = json['city_id'];
    regionAr = json['region_ar'];
    regionEn = json['region_en'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['city_ar'] = cityAr;
    data['city_en'] = cityEn;
    data['city_id'] = cityId;
    data['region_ar'] = regionAr;
    data['region_en'] = regionEn;
    return data;
  }
}

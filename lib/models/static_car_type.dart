class StaticCarType {
  StaticCarType({required this.reference, required this.ar, required this.en});
  String? reference;
  String? ar;
  String? en;

  StaticCarType.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['reference'] = reference;
    data['ar'] = ar;
    data['en'] = en;
    return data;
  }
}

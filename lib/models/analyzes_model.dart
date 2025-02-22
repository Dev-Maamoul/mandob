class AnalyzesModel {
  AnalyzesModel({
    required this.orders,
    required this.profit,
    required this.drivers,
  });
  late final int orders;
  late final double profit;
  late final int drivers;

  AnalyzesModel.fromJson(Map<String, dynamic> json) {
    orders = json['orders'];
    profit = json['profit'];
    drivers = json['drivers'];
  }

  Map<String, dynamic> toJson() {
    final dart = <String, dynamic>{};
    dart['orders'] = orders;
    dart['profit'] = profit;
    dart['drivers'] = drivers;
    return dart;
  }
}

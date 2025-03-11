import 'package:company_project/models/company.dart';
// import 'package:company_project/models/static';
import 'package:company_project/models/static_car_type.dart';
import 'package:company_project/models/static_cities.dart';
import 'package:company_project/models/static_identity_type.dart';

class DriverModel {
  DriverModel({
    required this.id,
    required this.idNumber,
    required this.referenceCode,
    required this.fullName,
    required this.dateOfBirth,
    required this.registrationDate,
    required this.mobile,
    required this.email,
    required this.carNumber,
    required this.vehicleSequenceNumber,
    required this.nationality,
    required this.completed,
    required this.imageUrl,
    required this.staticCities,
    required this.countOrders,
    required this.profits,
    required this.company,
    required this.staticCarType,
    required this.staticIdentityType,
  });
  String? id;
  String? idNumber;
  String? referenceCode;
  String? fullName;
  String? dateOfBirth;
  String? registrationDate;
  String? mobile;
  String? email;
  String? carNumber;
  String? vehicleSequenceNumber;
  String? nationality;
  bool? completed;
  String? imageUrl;
  StaticCities? staticCities;
  int? countOrders;
  double? profits;
  Company? company;
  StaticCarType? staticCarType;
  StaticIdentityType? staticIdentityType;

  DriverModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idNumber = json['id_number'];
    referenceCode = null;
    fullName = json['full_name'];
    dateOfBirth = json['date_of_birth'];
    registrationDate = json['registration_date'];
    mobile = json['mobile'];
    email = null;
    carNumber = json['car_number'];
    vehicleSequenceNumber = json['vehicle_sequence_number'];
    nationality = json['nationality'];
    completed = json['completed'];
    imageUrl = json['image_url'];
    staticCities = StaticCities.fromJson(json['static_cities']);
    countOrders = json['count_orders'];
    profits = json['profits'];
    company = Company.fromJson(json['company']);
    staticCarType = StaticCarType.fromJson(json['static_car_type']);
    staticIdentityType = StaticIdentityType.fromJson(
      json['static_identity_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['id_number'] = idNumber;
    data['reference_code'] = referenceCode;
    data['full_name'] = fullName;
    data['date_of_birth'] = dateOfBirth;
    data['registration_date'] = registrationDate;
    data['mobile'] = mobile;
    data['email'] = email;
    data['car_number'] = carNumber;
    data['vehicle_sequence_number'] = vehicleSequenceNumber;
    data['nationality'] = nationality;
    data['completed'] = completed;
    data['image_url'] = imageUrl;
    data['static_cities'] = staticCities?.toJson();
    data['count_orders'] = countOrders;
    data['profits'] = profits;
    data['company'] = company?.toJson();
    data['static_car_type'] = staticCarType?.toJson();
    data['static_identity_type'] = staticIdentityType?.toJson();
    return data;
  }
}




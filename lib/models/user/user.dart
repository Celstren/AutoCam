import 'dart:io';

import 'package:autocam/models/car/car.dart';
import 'package:autocam/utils/general/app_images.dart';
import 'package:flutter/material.dart';

class User {
  int id;
  String name;
  String email;
  String countryCode;
  String phone;
  String imageUrl;
  File imageFile;
  String timeZone;
  String licensePlate;
  List<Car> cars;

  User(
      {this.id = 0,
      this.name = "User T. Test",
      this.email = "user@gmail.com",
      this.countryCode = "",
      this.phone = "",
      this.imageUrl = "",
      this.timeZone = "",
      this.licensePlate = "ASD-569",
      this.cars,
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    countryCode = json['countryCode'] ?? "";
    phone = json['phone'] ?? "";
    imageUrl = json['imageUrl'] ?? "";
    timeZone = json['timeZone'] ?? "";
    licensePlate = json['licensePlate'] ?? "";
    cars = json['cars'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['countryCode'] = this.countryCode;
    data['phone'] = this.phone;
    data['imageUrl'] = this.imageUrl;
    data['timeZone'] = this.timeZone;
    data['cars'] = this.cars;
    return data;
  }

  bool get hasValidImage =>
      this.imageUrl != null &&
      this.imageUrl.isNotEmpty &&
      this.imageUrl.contains("http");

  ImageProvider get image {
    if(this.imageFile != null) {
      return FileImage(this.imageFile);
    }
    return AssetImage(AppImages.Avatar);
  }
}
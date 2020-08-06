import 'dart:io';

import 'package:flutter/cupertino.dart';

class Car {
  String licencePlate;
  String brand;
  String model;
  String color;
  String year;
  String actualKm;
  String ownerName;
  String dni;
  String companyName;
  String ruc;
  String address;
  String phone;
  String email;
  String imageURL;
  File imageFile;

  Car({
  this.licencePlate = "",
  this.brand = "",
  this.model = "",
  this.color = "",
  this.year = "",
  this.actualKm = "",
  this.ownerName = "",
  this.dni = "",
  this.companyName = "",
  this.ruc = "",
  this.address = "",
  this.phone = "",
  this.email = "",
  this.imageURL = "",
  this.imageFile,
  });

  ImageProvider get image => imageURL != null && imageURL.isNotEmpty ? NetworkImage(imageURL) : (imageFile != null ? FileImage(imageFile) : null);
}
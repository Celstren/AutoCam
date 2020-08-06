import 'package:autocam/models/user/user.dart';
import 'package:autocam/utils/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ProfileForm {
  TextEditingController  nameController      = TextEditingController();
  TextEditingController  emailController     = TextEditingController();
  DateTime               dateController      = DateTime.now();
  TextEditingController  addressController   = TextEditingController();
  MaskedTextController   dniController       = MaskedTextController(mask: "00000000");
  MaskedTextController   phoneController     = MaskedTextController(mask: "000-000-0000");

  String get name         => this.nameController.value.text;
  String get email        => this.emailController.value.text;
  String get address      => this.addressController.value.text;
  DateTime get birthday   => this.dateController;
  String get dni          => this.dniController.value.text;
  String get phone        => this.phoneController.value.text;

  bool validNameValue       = true;
  bool validEmailValue      = true;
  bool validAddressValue    = true;
  bool validDNIValue        = true;
  bool validPhoneValue      = true;

  bool get validName      => Validators.validString(name);
  bool get validEmail     => Validators.validEmail(email);
  bool get validAddress   => Validators.validString(address);
  bool get validDNI       => Validators.validNumber(dni);
  bool get validPhone     => Validators.validNumber(phone.replaceAll("-", ""));

  bool get validForm      => this.validName && this.validEmail && this.validAddress && this.validDNI && this.validPhone;

  void setValidatorValues() {
    this.validNameValue     = validName;
    this.validEmailValue    = validEmail;
    this.validAddressValue  = validAddress;
    this.validDNIValue      = validDNI;
    this.validPhoneValue    = validPhone;
  }

  void setDefaultValues(User user) {
    this.nameController.text = user.name;
    this.emailController.text = user.email;
    this.dateController = user.birthDay ?? DateTime.now();
    this.addressController.text = user.addres;
    this.dniController.text = user.dni;
    this.phoneController.text = user.phone;
  }
}
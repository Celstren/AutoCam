import 'package:autocam/models/car/car.dart';
import 'package:autocam/utils/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CarRegistrationForm {
  MaskedTextController      licencePlateController    = new MaskedTextController(mask: "AAA-000");
  TextEditingController     companyNameController     = new TextEditingController();
  TextEditingController     ownerNameController       = new TextEditingController();
  MoneyMaskedTextController actualKmController        = new MoneyMaskedTextController(rightSymbol: " km", leftSymbol: "", thousandSeparator: ".", precision: 0, decimalSeparator: "");
  TextEditingController     addressController         = new TextEditingController();
  MaskedTextController      phoneController           = new MaskedTextController(mask: "000-000-0000");
  TextEditingController     emailController           = new TextEditingController();
  TextEditingController     brandController           = new TextEditingController();
  TextEditingController     modelController           = new TextEditingController();
  TextEditingController     colorController           = new TextEditingController();
  MaskedTextController      yearController            = new MaskedTextController(mask: "0000");
  MaskedTextController      dniController             = new MaskedTextController(mask: "00000000");
  MaskedTextController      rucController             = new MaskedTextController(mask: "00000000000");

  String get licencePlate => this.licencePlateController.value.text;
  String get companyName  => this.companyNameController.value.text;
  String get ownerName    => this.ownerNameController.value.text;
  String get actualKm     => this.actualKmController.value.text;
  String get address      => this.addressController.value.text;
  String get phone        => this.phoneController.value.text;
  String get email        => this.emailController.value.text;
  String get brand        => this.brandController.value.text;
  String get model        => this.modelController.value.text;
  String get color        => this.colorController.value.text;
  String get year         => this.yearController.value.text;
  String get dni          => this.dniController.value.text;
  String get ruc          => this.rucController.value.text;

  bool validLicencePlateValue = true;
  bool validCompanyNameValue  = true;
  bool validOwnerNameValue    = true;
  bool validActualKmValue     = true;
  bool validAddressValue      = true;
  bool validPhoneValue        = true;
  bool validEmailValue        = true;
  bool validBrandValue        = true;
  bool validModelValue        = true;
  bool validColorValue        = true;
  bool validYearValue         = true;
  bool validDniValue          = true;
  bool validRucValue          = true;

  bool get validLicencePlate  => Validators.validString(licencePlate);
  bool get validCompanyName   => Validators.validString(companyName);
  bool get validOwnerName     => Validators.validString(ownerName);
  bool get validActualKm      => Validators.validString(actualKm);
  bool get validAddress       => Validators.validString(address);
  bool get validPhone         => Validators.validNumber(phone.replaceAll("-", ""));
  bool get validEmail         => Validators.validEmail(email);
  bool get validBrand         => Validators.validString(brand);
  bool get validModel         => Validators.validString(model);
  bool get validColor         => Validators.validString(color);
  bool get validYear          => Validators.validString(year);
  bool get validDni           => Validators.validString(dni);
  bool get validRuc           => Validators.validString(ruc);

  bool get validForm      => 
  this.validLicencePlateValue && 
  this.validCompanyNameValue && 
  this.validOwnerNameValue && 
  this.validActualKmValue && 
  this.validAddressValue && 
  this.validPhoneValue &&
  this.validEmailValue &&
  this.validBrandValue &&
  this.validModelValue &&
  this.validYearValue &&
  this.validDniValue &&
  this.validRucValue;

  void setValidatorValues() {
    this.validLicencePlateValue = validLicencePlate;
    this.validCompanyNameValue  = validCompanyName;
    this.validOwnerNameValue    = validOwnerName;
    this.validActualKmValue     = validActualKm;
    this.validAddressValue      = validAddress;
    this.validPhoneValue        = validPhone;
    this.validEmailValue        = validEmail;
    this.validBrandValue        = validBrand;
    this.validModelValue        = validModel;
    this.validColorValue        = validColor;
    this.validYearValue         = validYear;
    this.validDniValue          = validDni;
    this.validRucValue          = validRuc;
  }

  Car get valueCreated => Car(
    licencePlate: licencePlate,
    companyName:  companyName,
    ownerName:    ownerName,
    actualKm:     actualKm,
    address:      address,
    brand:        brand,
    model:        model,
    color:        color,
    phone:        phone,
    email:        email,
    year:         year,
    dni:          dni,
    ruc:          ruc,
  );

  void setDefaultValues(Car car) {
    this.licencePlateController.text  = car.licencePlate;
    this.companyNameController.text   = car.companyName;
    this.ownerNameController.text     = car.ownerName;
    this.actualKmController.text      = car.actualKm;
    this.addressController.text       = car.address;
    this.phoneController.text         = car.phone;
    this.emailController.text         = car.email;
    this.brandController.text         = car.brand;
    this.modelController.text         = car.model;
    this.colorController.text         = car.color;
    this.yearController.text          = car.year;
    this.dniController.text           = car.dni;
    this.rucController.text           = car.ruc;
  }
}
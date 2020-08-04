import 'package:autocam/models/car/car.dart';
import 'package:autocam/models/user/user.dart';
import 'package:autocam/pages/car_registration/car_registration_form.dart';
import 'package:autocam/utils/exports/app_common_widgets.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/global_controllers/global_controllers.dart';
import 'package:autocam/utils/helpers/remove_over_scroll_glow.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool test = true;

class CarRegistrationPage extends StatefulWidget {
  CarRegistrationPage({Key key}) : super(key: key);

  @override
  _CarRegistrationPageState createState() => _CarRegistrationPageState();
}

class _CarRegistrationPageState extends State<CarRegistrationPage> {
  CarRegistrationForm carRegistrationForm = CarRegistrationForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            _buildTitle(),
            Expanded(
              child: ScrollConfiguration(
                behavior: RemoveOverScrollGlow(),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _buildFormFields(),
                      _buildSaveButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.PrimaryBlue,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      size: 30,
                      color: AppColors.PrimaryWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(CarRegistrationStrings.Title,
              textAlign: TextAlign.center,
              style: AppTextStyle.whiteStyle(
                  fontSize: 36, fontFamily: AppFonts.Montserrat_Bold)),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 20),
          AppTextfield(
              label: CarRegistrationStrings.LicencePlate,
              hintText: CarRegistrationStrings.LicencePlateHint,
              controller: carRegistrationForm.licencePlateController,
              validator: carRegistrationForm.validLicencePlateValue,
              errorText: CarRegistrationStrings.LicencePlateError,
              onChanged: (value) {
                if (!carRegistrationForm.validLicencePlateValue) {
                  setState(() {
                    carRegistrationForm.validLicencePlateValue = true;
                  });
                }
              },
              showBorder: true),
          SizedBox(height: 15),
          AppTextfield(
              label: CarRegistrationStrings.CompanyName,
              hintText: CarRegistrationStrings.CompanyNameHint,
              controller: carRegistrationForm.companyNameController,
              validator: carRegistrationForm.validCompanyNameValue,
              errorText: CarRegistrationStrings.CompanyNameError,
              onChanged: (value) {
                if (!carRegistrationForm.validCompanyNameValue) {
                  setState(() {
                    carRegistrationForm.validCompanyNameValue = true;
                  });
                }
              },
              showBorder: true),
          SizedBox(height: 15),
          AppTextfield(
              label: CarRegistrationStrings.OwnerName,
              hintText: CarRegistrationStrings.OwnerNameHint,
              controller: carRegistrationForm.ownerNameController,
              validator: carRegistrationForm.validOwnerNameValue,
              errorText: CarRegistrationStrings.OwnerNameError,
              onChanged: (value) {
                if (!carRegistrationForm.validOwnerNameValue) {
                  setState(() {
                    carRegistrationForm.validOwnerNameValue = true;
                  });
                }
              },
              showBorder: true),
          SizedBox(height: 15),
          AppTextfield(
              label: CarRegistrationStrings.ActualKm,
              hintText: CarRegistrationStrings.ActualKmHint,
              controller: carRegistrationForm.actualKmController,
              validator: carRegistrationForm.validActualKmValue,
              errorText: CarRegistrationStrings.ActualKmError,
              onChanged: (value) {
                if (!carRegistrationForm.validActualKmValue) {
                  setState(() {
                    carRegistrationForm.validActualKmValue = true;
                  });
                }
              },
              showBorder: true),
          SizedBox(height: 15),
          AppTextfield(
              label: CarRegistrationStrings.Address,
              hintText: CarRegistrationStrings.AddressHint,
              controller: carRegistrationForm.addressController,
              validator: carRegistrationForm.validAddressValue,
              errorText: CarRegistrationStrings.AddressError,
              onChanged: (value) {
                if (!carRegistrationForm.validAddressValue) {
                  setState(() {
                    carRegistrationForm.validAddressValue = true;
                  });
                }
              },
              showBorder: true),
          SizedBox(height: 15),
          AppTextfield(
              label: CarRegistrationStrings.Phone,
              hintText: CarRegistrationStrings.PhoneHint,
              controller: carRegistrationForm.phoneController,
              validator: carRegistrationForm.validPhoneValue,
              errorText: CarRegistrationStrings.PhoneError,
              onChanged: (value) {
                if (!carRegistrationForm.validPhoneValue) {
                  setState(() {
                    carRegistrationForm.validPhoneValue = true;
                  });
                }
              },
              showBorder: true),
          SizedBox(height: 15),
          AppTextfield(
              label: CarRegistrationStrings.Email,
              hintText: CarRegistrationStrings.EmailHint,
              controller: carRegistrationForm.emailController,
              validator: carRegistrationForm.validEmailValue,
              errorText: CarRegistrationStrings.EmailError,
              onChanged: (value) {
                if (!carRegistrationForm.validEmailValue) {
                  setState(() {
                    carRegistrationForm.validEmailValue = true;
                  });
                }
              },
              showBorder: true),
          SizedBox(height: 15),
          AppTextfield(
              label: CarRegistrationStrings.Brand,
              hintText: CarRegistrationStrings.BrandHint,
              controller: carRegistrationForm.brandController,
              validator: carRegistrationForm.validBrandValue,
              errorText: CarRegistrationStrings.BrandError,
              onChanged: (value) {
                if (!carRegistrationForm.validBrandValue) {
                  setState(() {
                    carRegistrationForm.validBrandValue = true;
                  });
                }
              },
              showBorder: true),
          SizedBox(height: 15),
          AppTextfield(
              label: CarRegistrationStrings.Model,
              hintText: CarRegistrationStrings.ModelHint,
              controller: carRegistrationForm.modelController,
              validator: carRegistrationForm.validModelValue,
              errorText: CarRegistrationStrings.ModelError,
              onChanged: (value) {
                if (!carRegistrationForm.validModelValue) {
                  setState(() {
                    carRegistrationForm.validModelValue = true;
                  });
                }
              },
              showBorder: true),
          SizedBox(height: 15),
          AppTextfield(
              label: CarRegistrationStrings.Color,
              hintText: CarRegistrationStrings.ColorHint,
              controller: carRegistrationForm.colorController,
              validator: carRegistrationForm.validColorValue,
              errorText: CarRegistrationStrings.ColorError,
              onChanged: (value) {
                if (!carRegistrationForm.validColorValue) {
                  setState(() {
                    carRegistrationForm.validColorValue = true;
                  });
                }
              },
              showBorder: true),
          SizedBox(height: 15),
          AppTextfield(
              label: CarRegistrationStrings.Year,
              hintText: CarRegistrationStrings.YearHint,
              controller: carRegistrationForm.yearController,
              validator: carRegistrationForm.validYearValue,
              errorText: CarRegistrationStrings.YearError,
              onChanged: (value) {
                if (!carRegistrationForm.validYearValue) {
                  setState(() {
                    carRegistrationForm.validYearValue = true;
                  });
                }
              },
              showBorder: true),
          SizedBox(height: 15),
          AppTextfield(
              label: CarRegistrationStrings.Dni,
              hintText: CarRegistrationStrings.DniHint,
              controller: carRegistrationForm.dniController,
              validator: carRegistrationForm.validDniValue,
              errorText: CarRegistrationStrings.DniError,
              onChanged: (value) {
                if (!carRegistrationForm.validDniValue) {
                  setState(() {
                    carRegistrationForm.validDniValue = true;
                  });
                }
              },
              showBorder: true),
          SizedBox(height: 15),
          AppTextfield(
              label: CarRegistrationStrings.Ruc,
              hintText: CarRegistrationStrings.RucHint,
              controller: carRegistrationForm.rucController,
              validator: carRegistrationForm.validRucValue,
              errorText: CarRegistrationStrings.RucError,
              onChanged: (value) {
                if (!carRegistrationForm.validRucValue) {
                  setState(() {
                    carRegistrationForm.validRucValue = true;
                  });
                }
              },
              showBorder: true),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * .7,
            child: AppButton(
              backgroundColor: AppColors.PrimaryBlue,
              text: CarRegistrationStrings.Save,
              callback: () {
                if (test) {
                  User currentUser = GlobalController().getUserValue();
                  if (currentUser.cars != null) {
                    currentUser.cars.add(carRegistrationForm.valueCreated);
                  } else {
                    currentUser.cars = [
                      Car(
                        licencePlate: "ABC-123",
                      )
                    ];
                    GlobalController().updateCarSelected(currentUser.cars.first);
                  }
                  GlobalController().updateUser(currentUser);
                }
                //if (carRegistrationForm.validForm) {
                //  User currentUser = GlobalController().getUserValue();
                //  if (currentUser.cars != null) {
                //    currentUser.cars.add(carRegistrationForm.valueCreated);
                //  } else {
                //    currentUser.cars = [carRegistrationForm.valueCreated];
                //    GlobalController()
                //        .updateCarSelected(carRegistrationForm.valueCreated);
                //  }
                //  GlobalController().updateUser(currentUser);
                //} else {
                //  Fluttertoast.showToast(
                //      msg: "Datos ingresados inválidos",
                //      backgroundColor: AppColors.PrimaryDarkGrey,
                //      textColor: AppColors.PrimaryWhite);
                //  setState(() {
                //    carRegistrationForm.setValidatorValues();
                //  });
                //}
              },
              style: AppTextStyle.whiteStyle(
                  fontSize: 18, fontFamily: AppFonts.Montserrat_Bold),
            ),
          ),
        ],
      ),
    );
  }
}

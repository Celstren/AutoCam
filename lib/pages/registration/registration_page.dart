import 'package:autocam/pages/registration/registration_form.dart';
import 'package:autocam/pages/registration/widgets/registration_avatar.dart';
import 'package:autocam/utils/exports/app_common_widgets.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/exports/app_navigation.dart';
import 'package:autocam/utils/helpers/remove_over_scroll_glow.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  RegistrationForm registrationForm = new RegistrationForm();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
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
        ),
        onWillPop: () async {
          NavigationController().updateNavigationTab(NavigationTabs.login);
          return false;
        });
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
                  child: FlatButton(onPressed: () {
                    NavigationController().updateNavigationTab(NavigationTabs.login);
                  }, child: Icon(
                      Icons.close,
                      size: 30,
                      color: AppColors.PrimaryWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(RegistrationStrings.Title,
          textAlign: TextAlign.center,
              style: AppTextStyle.whiteStyle(
                  fontSize: 36, fontFamily: AppFonts.Montserrat_Bold)),
          SizedBox(height: 5),
          RegistrationAvatar(),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Container(
      height: 660,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          AppTextfield(
              label: RegistrationStrings.Name,
              hintText: RegistrationStrings.NameHint,
              controller: registrationForm.nameController,
              validator: registrationForm.validNameValue,
              errorText: RegistrationStrings.NameError,
              onChanged: (value) {
                if (!registrationForm.validNameValue) {
                  setState(() {
                    registrationForm.validNameValue = true;
                  });
                }
              },
              showBorder: true),
          AppTextfield(
              label: RegistrationStrings.Mail,
              hintText: RegistrationStrings.MailHint,
              controller: registrationForm.emailController,
              validator: registrationForm.validEmailValue,
              errorText: RegistrationStrings.MailError,
              onChanged: (value) {
                if (!registrationForm.validEmailValue) {
                  setState(() {
                    registrationForm.validEmailValue = true;
                  });
                }
              },
              showBorder: true),
          AppDateTextField(
              label: RegistrationStrings.Birthday,
              initialValue: registrationForm.dateController,
              onChange: (date) => print(date.toIso8601String()),
              showBorder: true),
          AppTextfield(
              label: RegistrationStrings.Address,
              hintText: RegistrationStrings.AddressHint,
              validator: registrationForm.validAddressValue,
              controller: registrationForm.addressController,
              errorText: RegistrationStrings.AddressError,
              onChanged: (value) {
                if (!registrationForm.validAddressValue) {
                  setState(() {
                    registrationForm.validAddressValue = true;
                  });
                }
              },
              showBorder: true),
          AppTextfield(
              label: RegistrationStrings.DNI,
              hintText: RegistrationStrings.DNIHint,
              validator: registrationForm.validDNIValue,
              controller: registrationForm.dniController,
              errorText: RegistrationStrings.DNIError,
              onChanged: (value) {
                if (!registrationForm.validDNIValue) {
                  setState(() {
                    registrationForm.validDNIValue = true;
                  });
                }
              },
              showBorder: true),
          AppTextfield(
              label: RegistrationStrings.Phone,
              hintText: RegistrationStrings.PhoneHint,
              validator: registrationForm.validPhoneValue,
              controller: registrationForm.phoneController,
              errorText: RegistrationStrings.PhoneError,
              onChanged: (value) {
                if (!registrationForm.validPhoneValue) {
                  setState(() {
                    registrationForm.validPhoneValue = true;
                  });
                }
              },
              showBorder: true),
          AppTextfield(
              label: RegistrationStrings.Password,
              hintText: RegistrationStrings.PasswordHint,
              validator: registrationForm.validPasswordValue,
              controller: registrationForm.passwordController,
              errorText: RegistrationStrings.PasswordError,
              onChanged: (value) {
                if (!registrationForm.validPasswordValue) {
                  setState(() {
                    registrationForm.validPasswordValue = true;
                  });
                }
              },
              showBorder: true),
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
              text: RegistrationStrings.Register,
              callback: () {
                if (registrationForm.validForm) {
                  Fluttertoast.showToast(msg: "Valid Form", backgroundColor: AppColors.PrimaryDarkGrey, textColor: AppColors.PrimaryWhite);
                } else {
                  Fluttertoast.showToast(msg: "Datos ingresados inválidos", backgroundColor: AppColors.PrimaryDarkGrey, textColor: AppColors.PrimaryWhite);
                  setState(() {
                    registrationForm.setValidatorValues();
                  });
                }
              },
              style: AppTextStyle.whiteStyle(fontSize: 18, fontFamily: AppFonts.Montserrat_Bold),
            ),
          ),
        ],
      ),
    );
  }
}

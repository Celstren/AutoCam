import 'package:autocam/models/user/user.dart';
import 'package:autocam/pages/profile/profile_form.dart';
import 'package:autocam/pages/profile/widget/profile_avatar.dart';
import 'package:autocam/utils/exports/app_common_widgets.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/global_controllers/global_controllers.dart';
import 'package:autocam/utils/helpers/remove_over_scroll_glow.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileForm profileForm = new ProfileForm();

  @override
  void initState() {
    User currentUser = GlobalController().getUserValue();
    GlobalController().updateUserProfile(currentUser);
    profileForm.setDefaultValues(currentUser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 30,
                child: FlatButton(
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.close, color: AppColors.PrimaryWhite, size: 30),
              ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(ProfileStrings.Title,
              style: AppTextStyle.whiteStyle(
                  fontSize: AppFontSizes.Title1,
                  fontFamily: AppFonts.Montserrat_Bold)),
          SizedBox(height: 10),
          ProfileAvatar(),
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
              label: ProfileStrings.Name,
              hintText: ProfileStrings.NameHint,
              controller: profileForm.nameController,
              validator: profileForm.validNameValue,
              errorText: ProfileStrings.NameError,
              onChanged: (value) {
                if (!profileForm.validNameValue) {
                  setState(() {
                    profileForm.validNameValue = true;
                  });
                }
              },
              showBorder: true),
          AppTextfield(
              label: ProfileStrings.Mail,
              hintText: ProfileStrings.MailHint,
              controller: profileForm.emailController,
              validator: profileForm.validEmailValue,
              errorText: ProfileStrings.MailError,
              onChanged: (value) {
                if (!profileForm.validEmailValue) {
                  setState(() {
                    profileForm.validEmailValue = true;
                  });
                }
              },
              showBorder: true),
          AppDateTextField(
              label: ProfileStrings.Birthday,
              initialValue: profileForm.dateController,
              onChange: (date) => print(date.toIso8601String()),
              showBorder: true),
          AppTextfield(
              label: ProfileStrings.Address,
              hintText: ProfileStrings.AddressHint,
              validator: profileForm.validAddressValue,
              controller: profileForm.addressController,
              errorText: ProfileStrings.AddressError,
              onChanged: (value) {
                if (!profileForm.validAddressValue) {
                  setState(() {
                    profileForm.validAddressValue = true;
                  });
                }
              },
              showBorder: true),
          AppTextfield(
              label: ProfileStrings.DNI,
              hintText: ProfileStrings.DNIHint,
              validator: profileForm.validDNIValue,
              controller: profileForm.dniController,
              errorText: ProfileStrings.DNIError,
              onChanged: (value) {
                if (!profileForm.validDNIValue) {
                  setState(() {
                    profileForm.validDNIValue = true;
                  });
                }
              },
              showBorder: true),
          AppTextfield(
              label: ProfileStrings.Phone,
              hintText: ProfileStrings.PhoneHint,
              validator: profileForm.validPhoneValue,
              controller: profileForm.phoneController,
              errorText: ProfileStrings.PhoneError,
              onChanged: (value) {
                if (!profileForm.validPhoneValue) {
                  setState(() {
                    profileForm.validPhoneValue = true;
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
              text: ProfileStrings.Save,
              callback: () {
                if (profileForm.validForm) {
                  User userUpdated = GlobalController().getUserValue();
                  User userProfile = GlobalController().getUserProfileValue();
                  userUpdated.addres = profileForm.address;
                  userUpdated.birthDay = profileForm.birthday;
                  userUpdated.email = profileForm.email;
                  userUpdated.name = profileForm.name;
                  userUpdated.dni = profileForm.dni;
                  userUpdated.phone = profileForm.phone;
                  userUpdated.imageFile = userProfile.imageFile;
                  userUpdated.imageUrl = userProfile.imageUrl;
                  GlobalController().updateUser(userUpdated);
                  Fluttertoast.showToast(
                      msg: "Datos actualizados",
                      backgroundColor: AppColors.PrimaryDarkGrey,
                      textColor: AppColors.PrimaryWhite);
                  Navigator.pop(context);
                } else {
                  Fluttertoast.showToast(
                      msg: "Datos ingresados inválidos",
                      backgroundColor: AppColors.PrimaryDarkGrey,
                      textColor: AppColors.PrimaryWhite);
                  setState(() {
                    profileForm.setValidatorValues();
                  });
                }
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

import 'package:autocam/utils/exports/app_common_widgets.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/exports/app_navigation.dart';
import 'package:autocam/utils/helpers/remove_over_scroll_glow.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController _emailController      = TextEditingController(text: RegistrationStrings.MailHint);

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
                          SizedBox(height: MediaQuery.of(context).size.height * .15),
                          _buildFormFields(),
                          _buildSendButton(),
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
          NavigationController()
              .updateNavigationTab(NavigationTabs.login);
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
          Text(ForgotPasswordStrings.Title,
          textAlign: TextAlign.center,
              style: AppTextStyle.whiteStyle(
                  fontSize: 36, fontFamily: AppFonts.Montserrat_Bold)),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          AppTextfield(
              label: ForgotPasswordStrings.Mail,
              hintText: ForgotPasswordStrings.MailHint,
              controller: _emailController,
              showBorder: true),
        ],
      ),
    );
  }

  Widget _buildSendButton() {
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
              text: ForgotPasswordStrings.Send,
              callback: () => print('Enviar'),
              style: AppTextStyle.whiteStyle(fontSize: 18, fontFamily: AppFonts.Montserrat_Bold),
            ),
          ),
        ],
      ),
    );
  }
}

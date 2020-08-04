import 'package:autocam/pages/login/widgets/facebook_button.dart';
import 'package:autocam/pages/login/widgets/google_button.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/exports/app_common_widgets.dart';
import 'package:autocam/utils/exports/app_navigation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.MainBackground),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * .1),
              _buildTitle(),
              SizedBox(height: 10),
              _buildWelcome(),
              SizedBox(height: 20),
              _buildFormFields(),
              SizedBox(height: 20),
              _buildLoginButtons(),
              SizedBox(height: 10),
              _buildForgotPassword(),
              SizedBox(height: 10),
              _buildRegister(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      child: Center(
        child: Text(
          LoginStrings.Title,
          style: AppTextStyle.blueStyle(
              fontSize: 48, fontFamily: AppFonts.Montserrat_Bold),
        ),
      ),
    );
  }

  Widget _buildWelcome() {
    return Container(
      child: Text(
        LoginStrings.Welcome,
        style: AppTextStyle.blueStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildFormFields() {
    return Container(
      child: Column(
        children: <Widget>[
          AppTextfield(
              label: LoginStrings.UserLabel, hintText: LoginStrings.UserHint),
          SizedBox(height: 20),
          AppPasswordTextfield(
              label: LoginStrings.Password,
              hintText: LoginStrings.PasswordHint),
        ],
      ),
    );
  }

  Widget _buildLoginButtons() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 300,
            height: 50,
            child: AppButton(
              backgroundColor: AppColors.PrimaryOrange,
              text: LoginStrings.Login,
              callback: () => NavigationController().updateNavigationTab(NavigationTabs.home),
              style: AppTextStyle.whiteStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 20),
          GoogleButton(),
          SizedBox(height: 5),
          FacebookButton(),
        ],
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Container(
      width: 300,
      height: 50,
      child: AppButton(
        backgroundColor: Colors.transparent,
        text: LoginStrings.ForgetPassword,
        callback: () => NavigationController().updateNavigationTab(NavigationTabs.forgot_password),
        style: AppTextStyle.whiteStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildRegister() {
    return Container(
      width: 300,
      height: 50,
      child: Column(
        children: <Widget>[
          Text(
            LoginStrings.NewUser,
            style: AppTextStyle.whiteStyle(
              fontSize: 18,
            ),
          ),
          AppButton(
            backgroundColor: Colors.transparent,
            text: LoginStrings.Register,
            callback: () => NavigationController()
                .updateNavigationTab(NavigationTabs.registration),
            style: AppTextStyle.whiteStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

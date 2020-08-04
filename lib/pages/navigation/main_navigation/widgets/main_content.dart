import 'package:autocam/pages/forgot_password/forgot_password_page.dart';
import 'package:autocam/pages/login/login_page.dart';
import 'package:autocam/pages/navigation/home_navigation/home_navigation_page.dart';
import 'package:autocam/pages/navigation/main_navigation/main_navigation_controller.dart';
import 'package:autocam/pages/navigation/main_navigation/main_navigation_tabs.dart';
import 'package:autocam/pages/registration/registration_page.dart';
import 'package:flutter/material.dart';

class NavigationContent extends StatelessWidget {
  const NavigationContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<NavigationTabs>(
        stream: NavigationController().getNavigationTabEvents(),
        builder: (BuildContext context, AsyncSnapshot<NavigationTabs> navTabSnapshot) {
        switch (navTabSnapshot.connectionState) {
          case ConnectionState.none:
            return Container();
            break;
          case ConnectionState.waiting:
            return Container();
            break;
          case ConnectionState.active:
            return _buildTabWidget(navTabSnapshot.data ?? NavigationTabs.login);
            break;
          case ConnectionState.done:
            return Container();
            break;
          default:
          return Container();
        }
      }),
    );
  }

  Widget _buildTabWidget(NavigationTabs tab) {
    switch (tab) {
      case NavigationTabs.login:
          return LoginPage();
        break;
      case NavigationTabs.home:
          return HomeNavigationPage();
        break;
      case NavigationTabs.registration:
          return RegistrationPage();
        break;
      case NavigationTabs.forgot_password:
          return ForgotPassword();
      default:
        return Container();
    }
  }
}
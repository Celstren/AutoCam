import 'package:autocam/pages/navigation/home_navigation/widgets/home_drawer_logout.dart';
import 'package:autocam/pages/navigation/home_navigation/widgets/home_drawer_options.dart';
import 'package:autocam/pages/navigation/home_navigation/widgets/home_drawer_user_data.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: AppColors.PrimaryWhite,
        child: Column(
          children: <Widget>[
            HomeDrawerUserData(),
            Expanded(child: HomeDrawerOptions()),
            HomeDrawerLogout(),
          ],
        ),
      ),
    );
  }
}

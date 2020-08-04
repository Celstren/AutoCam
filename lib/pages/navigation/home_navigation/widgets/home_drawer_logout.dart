import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/exports/app_navigation.dart';
import 'package:flutter/material.dart';

class HomeDrawerLogout extends StatelessWidget {
  const HomeDrawerLogout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationController().updateNavigationTab(NavigationTabs.login),
      child: Container(
        height: MediaQuery.of(context).size.height * .15,
        decoration: BoxDecoration(
          color: AppColors.PrimaryBlue,
          border:
              Border(top: BorderSide(color: AppColors.PrimaryWhite, width: 2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.exit_to_app, size: 20, color: AppColors.PrimaryWhite),
            SizedBox(width: 10),
            Text(
              HomeNavigationStrings.Logout,
              textAlign: TextAlign.center,
              style: AppTextStyle.whiteStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

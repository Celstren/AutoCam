import 'package:autocam/pages/navigation/home_navigation/widgets/sos_button.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

Widget workshopAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.PrimaryBlue,
    title: Text(HomeStrings.Workshop,
        style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.AppBarTitle1)),
    centerTitle: true,
    actions: <Widget>[sosButton(context)],
  );
}

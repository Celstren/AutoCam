import 'package:autocam/pages/navigation/home_navigation/widgets/sos_button.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

Widget homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.PrimaryBlue,
    actions: <Widget>[sosButton(context)],
  );
}

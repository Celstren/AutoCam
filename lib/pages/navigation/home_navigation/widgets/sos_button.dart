import 'package:autocam/pages/navigation/methods/navigation_methods.dart';
import 'package:autocam/pages/sos/sos_page.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

Widget sosButton(BuildContext context) {
  return GestureDetector(
    onTap: () => pushWidget(context, SOSPage()),
    child: Container(
      height: 30,
      width: 30,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: AppColors.PrimaryRed,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(HomeNavigationStrings.SOS,
            textAlign: TextAlign.center,
            style: AppTextStyle.whiteStyle(fontSize: 10)),
      ),
    ),
  );
}

import 'package:autocam/pages/navigation/home_navigation/widgets/sos_button.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

Widget benefitsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.PrimaryBlue,
    title: Text(HomeStrings.Benefits,
        style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.AppBarTitle1)),
    centerTitle: true,
    bottom: TabBar(
      indicatorColor: AppColors.PrimaryWhite,
      tabs: [
        Tab(text: BenefitsStrings.Economics),
        Tab(text: BenefitsStrings.Others),
      ],
    ),
    actions: <Widget>[sosButton(context)],
  );
}

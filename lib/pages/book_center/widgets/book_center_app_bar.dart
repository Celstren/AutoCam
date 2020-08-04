import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

Widget bookCenterAppBar = AppBar(
  backgroundColor: AppColors.PrimaryBlue,
  title: Text(HomeStrings.BookCenter, style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.AppBarTitle1)),
  centerTitle: true,
  //actions: <Widget>[
  //  Container(
  //    height: 30,
  //    width: 30,
  //    margin: EdgeInsets.only(right: 20),
  //    decoration: BoxDecoration(
  //      color: AppColors.PrimaryWhite,
  //      shape: BoxShape.circle,
  //    ),
  //    child: Center(
  //      child: Icon(Icons.add, size: 20, color: AppColors.PrimaryBlue),
  //    ),
  //  ),
  //],
);
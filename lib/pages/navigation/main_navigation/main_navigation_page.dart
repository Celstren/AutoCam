import 'package:autocam/pages/navigation/main_navigation/widgets/main_content.dart';
import 'package:autocam/utils/general/app_colors.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.PrimaryWhite,
        body: NavigationContent(),
      ),
    );
  }
}

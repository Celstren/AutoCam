import 'package:autocam/models/service/service.dart';
import 'package:autocam/pages/home/widgets/home_options.dart';
import 'package:autocam/pages/home/widgets/home_user.dart';
import 'package:autocam/pages/navigation/home_navigation/home_navigation_controller.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/helpers/remove_over_scroll_glow.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    HomeNavigationController().updateServiceSelected(Service(title: ""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: AppColors.PrimaryBlue),
        child: ScrollConfiguration(
          behavior: RemoveOverScrollGlow(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HomeUser(),
                HomeOptions(),
              ],
            ),
          ),
        ),
      );
  }
}

import 'package:autocam/pages/navigation/home_navigation/home_navigation_controller.dart';
import 'package:autocam/pages/navigation/home_navigation/widgets/home_content.dart';
import 'package:autocam/pages/navigation/home_navigation/widgets/home_drawer.dart';
import 'package:autocam/pages/navigation/home_navigation/widgets/home_navigation_app_bar.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/exports/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeNavigationPage extends StatefulWidget {
  HomeNavigationPage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeNavigationPage> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          AppColors.PrimaryBlue, //or set color with: Color(0xFF0000FF)
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomeNavigationTabs>(
      stream: HomeNavigationController().getHomeNavigationTabEvents(),
      builder: (BuildContext context,
          AsyncSnapshot<HomeNavigationTabs> homeNavTabSnapshot) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: homeNavigationAppBar(context,
                homeNavTabSnapshot.data ?? HomeNavigationTabs.home),
            drawer: HomeDrawer(),
            body: HomeNavigationContent(navTabSnapshot: homeNavTabSnapshot),
          ),
        );
      },
    );
  }
}

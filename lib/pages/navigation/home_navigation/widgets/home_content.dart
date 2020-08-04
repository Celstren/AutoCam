import 'package:autocam/pages/benefits/benefits_page.dart';
import 'package:autocam/pages/book_center/book_center_page.dart';
import 'package:autocam/pages/home/home_page.dart';
import 'package:autocam/pages/message/message_page.dart';
import 'package:autocam/pages/rating/rating_page.dart';
import 'package:autocam/pages/services/service_selected_page.dart';
import 'package:autocam/pages/services/services_page.dart';
import 'package:autocam/pages/workshop/workshop_page.dart';
import 'package:autocam/utils/exports/app_navigation.dart';
import 'package:flutter/material.dart';

class HomeNavigationContent extends StatelessWidget {
  final AsyncSnapshot<HomeNavigationTabs> navTabSnapshot;

  const HomeNavigationContent({Key key, this.navTabSnapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (navTabSnapshot.connectionState) {
      case ConnectionState.none:
        return Container();
        break;
      case ConnectionState.waiting:
        return Container();
        break;
      case ConnectionState.active:
        return _buildTabWidget(navTabSnapshot.data ?? HomeNavigationTabs.home);
        break;
      case ConnectionState.done:
        return Container();
        break;
      default:
        return Container();
    }
  }

  Widget _buildTabWidget(HomeNavigationTabs tab) {
    switch (tab) {
      case HomeNavigationTabs.home:
        return HomePage();
        break;
      case HomeNavigationTabs.book_center:
        return BookCenterPage();
        break;
      case HomeNavigationTabs.services:
        return ServicesPage();
        break;
      case HomeNavigationTabs.services_selected:
        return ServiceSelectedPage();
        break;
      case HomeNavigationTabs.benefits:
        return BenefitsPage();
        break;
      case HomeNavigationTabs.message:
        return MessagePage();
        break;
      case HomeNavigationTabs.workshop:
        return WorkshopPage();
        break;
      case HomeNavigationTabs.rating:
        return RatingPage();
        break;
      default:
        return Container();
        break;
    }
  }
}

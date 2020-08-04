import 'package:autocam/pages/benefits/widgets/benefits_app_bar.dart';
import 'package:autocam/pages/book_center/widgets/book_center_app_bar.dart';
import 'package:autocam/pages/home/widgets/home_app_bar.dart';
import 'package:autocam/pages/message/widgets/message_app_bar.dart';
import 'package:autocam/pages/rating/widgets/rating_app_bar.dart';
import 'package:autocam/pages/services/widget/services_app_bar.dart';
import 'package:autocam/pages/workshop/widgets/workshop_app_bar.dart';
import 'package:autocam/utils/exports/app_navigation.dart';
import 'package:flutter/material.dart';

AppBar homeNavigationAppBar(BuildContext context, HomeNavigationTabs tabs) {
  switch(tabs) {
    case HomeNavigationTabs.home:
      return homeAppBar(context);
      break;
    case HomeNavigationTabs.book_center:
      return bookCenterAppBar;
      break;
    case HomeNavigationTabs.services: case HomeNavigationTabs.services_selected:
      return servicesAppBar(context);
      break;
    case HomeNavigationTabs.benefits:
      return benefitsAppBar(context);
      break;
    case HomeNavigationTabs.message:
      return messagesAppBar(context);
      break;
    case HomeNavigationTabs.workshop:
      return workshopAppBar(context);
      break;
    case HomeNavigationTabs.rating:
      return ratingAppBar(context);
      break;
    default:
      return AppBar();
      break;
  }
}
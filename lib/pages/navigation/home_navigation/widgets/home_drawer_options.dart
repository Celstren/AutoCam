import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/exports/app_navigation.dart';
import 'package:autocam/utils/helpers/remove_over_scroll_glow.dart';
import 'package:flutter/material.dart';

class HomeDrawerOptions extends StatelessWidget {
  const HomeDrawerOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildOption(
      {IconData iconData = Icons.android,
      String text = "",
      Function callback,
      bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        if (callback != null) {
          callback();
          Navigator.pop(context);
        }
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.HomeOptionBlue : AppColors.PrimaryWhite,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Icon(iconData, size: 30, color: AppColors.PrimaryBlue),
            SizedBox(width: 10),
            Text(text, style: AppTextStyle.blueStyle(fontSize: AppFontSizes.SubTitle1)),
          ],
        ),
      ),
    );
  }

    return StreamBuilder<HomeNavigationTabs>(
        stream: HomeNavigationController().getHomeNavigationTabEvents(),
        builder: (BuildContext context,
            AsyncSnapshot<HomeNavigationTabs> homeNavTabSnapshot) {
          switch (homeNavTabSnapshot.connectionState) {
            case ConnectionState.none:
              return Container();
              break;
            case ConnectionState.waiting:
              return Container();
              break;
            case ConnectionState.active:
              return ScrollConfiguration(
                  behavior: RemoveOverScrollGlow(),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          _buildOption(
                            text: HomeStrings.Home,
                            iconData: Icons.home,
                            callback: () => HomeNavigationController()
                                .updateHomeNavigationTab(
                                    HomeNavigationTabs.home),
                            isSelected: homeNavTabSnapshot.data ==
                                HomeNavigationTabs.home,
                          ),
                          _buildOption(
                            text: HomeStrings.BookCenter,
                            iconData: Icons.calendar_today,
                            callback: () => HomeNavigationController()
                                .updateHomeNavigationTab(
                                    HomeNavigationTabs.book_center),
                            isSelected: homeNavTabSnapshot.data ==
                                HomeNavigationTabs.book_center,
                          ),
                          _buildOption(
                            text: HomeStrings.Services,
                            iconData: Icons.settings,
                            callback: () => HomeNavigationController()
                                .updateHomeNavigationTab(
                                    HomeNavigationTabs.services),
                            isSelected: homeNavTabSnapshot.data ==
                                HomeNavigationTabs.services,
                          ),
                          _buildOption(
                            text: HomeStrings.Benefits,
                            iconData: Icons.star,
                            callback: () => HomeNavigationController()
                                .updateHomeNavigationTab(
                                    HomeNavigationTabs.benefits),
                            isSelected: homeNavTabSnapshot.data ==
                                HomeNavigationTabs.benefits,
                          ),
                          _buildOption(
                            text: HomeStrings.Message,
                            iconData: Icons.message,
                            callback: () => HomeNavigationController()
                                .updateHomeNavigationTab(
                                    HomeNavigationTabs.message),
                            isSelected: homeNavTabSnapshot.data ==
                                HomeNavigationTabs.message,
                          ),
                          _buildOption(
                            text: HomeStrings.Workshop,
                            iconData: Icons.location_on,
                            callback: () => HomeNavigationController()
                                .updateHomeNavigationTab(
                                    HomeNavigationTabs.workshop),
                            isSelected: homeNavTabSnapshot.data ==
                                HomeNavigationTabs.workshop,
                          ),
                          _buildOption(
                            text: HomeStrings.Rating,
                            iconData: Icons.attach_money,
                            callback: () => HomeNavigationController()
                                .updateHomeNavigationTab(
                                    HomeNavigationTabs.rating),
                            isSelected: homeNavTabSnapshot.data ==
                                HomeNavigationTabs.rating,
                          ),
                        ],
                      ),
                    ),
                  ));
              break;
            case ConnectionState.done:
              return Container();
              break;
            default:
              return Container();
          }
        });
  }
}

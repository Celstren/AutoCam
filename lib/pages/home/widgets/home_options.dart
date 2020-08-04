import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/exports/app_navigation.dart';
import 'package:flutter/material.dart';

class HomeOptions extends StatelessWidget {
  const HomeOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.PrimaryWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          _buildOption(icon: Icons.calendar_today, name: HomeStrings.BookCenter, callback: () => HomeNavigationController().updateHomeNavigationTab(HomeNavigationTabs.book_center)),
          SizedBox(height: 10),
          _buildOption(icon: Icons.settings, name: HomeStrings.Services, callback: () => HomeNavigationController().updateHomeNavigationTab(HomeNavigationTabs.services)),
          SizedBox(height: 10),
          _buildOption(icon: Icons.star, name: HomeStrings.Benefits, callback: () => HomeNavigationController().updateHomeNavigationTab(HomeNavigationTabs.benefits)),
          SizedBox(height: 10),
          _buildOption(icon: Icons.message, name: HomeStrings.Message, callback: () => HomeNavigationController().updateHomeNavigationTab(HomeNavigationTabs.message)),
          SizedBox(height: 10),
          _buildOption(icon: Icons.location_on, name: HomeStrings.Workshop, callback: () => HomeNavigationController().updateHomeNavigationTab(HomeNavigationTabs.workshop)),
          SizedBox(height: 10),
          _buildOption(icon: Icons.attach_money, name: HomeStrings.Rating, callback: () => HomeNavigationController().updateHomeNavigationTab(HomeNavigationTabs.rating)),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildOption(
      {String name = "",
      IconData icon = Icons.accessibility,
      Function callback}) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 44,
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: AppColors.HomeOptionBlue,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon, color: AppColors.PrimaryWhite, size: 20),
                SizedBox(width: 10),
                Text(
                  name,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.whiteStyle(fontSize: 18),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios,
                color: AppColors.PrimaryWhite, size: 20),
          ],
        ),
      ),
    );
  }
}

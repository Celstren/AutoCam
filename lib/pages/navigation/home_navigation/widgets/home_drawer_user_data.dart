import 'package:autocam/models/user/user.dart';
import 'package:autocam/utils/exports/app_common_widgets.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/global_controllers/global_controllers.dart';
import 'package:flutter/material.dart';

class HomeDrawerUserData extends StatelessWidget {
  const HomeDrawerUserData({Key key}) : super(key: key);

  Widget _buildUserData(User user) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.PrimaryBlue,
        border: Border(bottom: BorderSide(color: AppColors.PrimaryWhite, width: 2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AppAvatar(size: 60, user: user),
              ],
            ),
          ),
          Container(
            height: 25,
            child: Text(
              user.name,
              textAlign: TextAlign.start,
              overflow: TextOverflow.fade,
              style: AppTextStyle.whiteStyle(
                fontSize: 12,
                fontFamily: AppFonts.Montserrat_Bold,
              ),
            ),
          ),
          Container(
            height: 25,
            child: Text(
              user.email,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: AppTextStyle.whiteStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: GlobalController().getUserEvents(),
        builder: (BuildContext context, AsyncSnapshot<User> userSnapshot) {
          switch (userSnapshot.connectionState) {
            case ConnectionState.none:
              return Container();
              break;
            case ConnectionState.waiting:
              return Container();
              break;
            case ConnectionState.active:
              return _buildUserData(userSnapshot.data ?? User());
              break;
            case ConnectionState.done:
              return Container();
              break;
            default:
              return Container();
              break;
          }
        });
  }
}

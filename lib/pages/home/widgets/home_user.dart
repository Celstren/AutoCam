import 'package:autocam/models/user/user.dart';
import 'package:autocam/utils/exports/app_common_widgets.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/global_controllers/global_controllers.dart';
import 'package:autocam/utils/widgets/app_car_selector.dart';
import 'package:flutter/material.dart';

class HomeUser extends StatelessWidget {
  const HomeUser({Key key}) : super(key: key);

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
            if (!userSnapshot.hasData) return Container();
            return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppAvatar(
                    size: 120,
                    user: userSnapshot.hasData ? userSnapshot.data : User(),
                  ),
                  SizedBox(height: 5),
                  Text(
                    userSnapshot.data.name,
                    style: AppTextStyle.whiteStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.Montserrat_Bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: <Widget>[
                      Text(
                        userSnapshot.data.email,
                        style: AppTextStyle.whiteStyle(fontSize: 12),
                      ),
                      SizedBox(height: 5),
                      AppCarSelector(),
                    ],
                  )
                ],
              ),
            );
            break;
          case ConnectionState.done:
            return Container();
            break;
          default:
            return Container();
        }
      },
    );
  }
}

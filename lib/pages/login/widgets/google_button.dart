import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 35,
      child: Material(
        color: AppColors.GoogleLightBlue,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          splashColor: AppColors.PrimaryGrey.withOpacity(.5),
          highlightColor: AppColors.GoogleLightBlue.withOpacity(.5),
          onTap: () => print('Test'),
          borderRadius: BorderRadius.circular(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 35,
                width: 35,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColors.PrimaryWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 7),
                  child: Image(
                    image: AssetImage(AppImages.GoogleLogo),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                LoginStrings.GoogleLogin,
                style: AppTextStyle.whiteStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 35,
                width: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

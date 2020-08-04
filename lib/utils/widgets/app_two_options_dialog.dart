import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

class TwoOptionsDialog extends StatelessWidget {
  final String title;
  final String leftOption;
  final String rightOption;
  final Function onLeftPress;
  final Function onRightPress;
  final Color background;
  final Color titleColor;
  final Color leftOptionTextColor;
  final Color leftOptionColor;
  final Color rightOptionTextColor;
  final Color rightOptionColor;
  final IconData icon;
  final Color iconColor;

  const TwoOptionsDialog({
    Key key,
    this.title = "Sample Title",
    this.leftOption = "First Option",
    this.rightOption = "Second Option",
    this.onLeftPress,
    this.onRightPress,
    this.background = AppColors.PrimaryWhite,
    this.titleColor = AppColors.PrimaryOrange,
    this.leftOptionTextColor = AppColors.PrimaryWhite,
    this.rightOptionTextColor = AppColors.PrimaryWhite,
    this.leftOptionColor = AppColors.PrimaryBlue,
    this.rightOptionColor = AppColors.PrimaryOrange,
    this.icon = Icons.error,
    this.iconColor = AppColors.PrimaryOrange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 180,
          width: MediaQuery.of(context).size.width * .8,
          decoration: BoxDecoration(color: background),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              icon != null
                  ? Icon(
                      icon,
                      size: 60,
                      color: iconColor,
                    )
                  : Container(),
              Container(
                width: MediaQuery.of(context).size.width * .65,
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: AppFontSizes.Title1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: onLeftPress,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: leftOptionColor),
                        width: MediaQuery.of(context).size.width * .32,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            leftOption,
                            style: TextStyle(
                              color: leftOptionTextColor,
                              fontSize: AppFontSizes.Title1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onRightPress,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: rightOptionColor),
                        width: MediaQuery.of(context).size.width * .32,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            rightOption,
                            style: TextStyle(
                              color: rightOptionTextColor,
                              fontSize: AppFontSizes.Title1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

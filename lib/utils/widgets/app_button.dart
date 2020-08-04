import 'package:autocam/utils/general/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Function callback;
  final TextStyle style;

  const AppButton({
    Key key,
    this.backgroundColor = AppColors.PrimaryBlue,
    this.text = "Button",
    this.callback,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          splashColor: AppColors.PrimaryGrey.withOpacity(.5),
          highlightColor: backgroundColor.withOpacity(.5),
          onTap: callback,
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: Text(
              text,
              style: style,
            ),
          ),
        ));
  }
}

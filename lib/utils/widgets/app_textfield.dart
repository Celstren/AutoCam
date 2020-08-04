import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  final bool showBorder;
  final bool validator;
  final bool enabled;
  final String errorText;
  final Function(String) onChanged;

  const AppTextfield({
    Key key,
    this.hintText = "",
    this.controller,
    this.label = "",
    this.showBorder = false,
    this.enabled = true, 
    this.validator = true,
    this.errorText = "", 
    this.onChanged,
  }) : super(key: key);

  Border get _border {
    if (showBorder){
      if (validator) {
        return Border.all(color: AppColors.PrimaryBlack, width: 1);
      } else {
        return Border.all(color: AppColors.PrimaryRed, width: 1);
      }
    }
    return null;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: AppTextStyle.blackStyle(fontSize: 18)),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.PrimaryWhite,
              borderRadius: BorderRadius.circular(10),
              border: _border,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  enabled: enabled,
                  controller: controller,
                  onChanged: onChanged,
                  style: AppTextStyle.darkGreyStyle(fontSize: 18),
                  decoration: InputDecoration.collapsed(
                    hintText: hintText,
                    hintStyle: AppTextStyle.darkGreyStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          !validator ? Text(errorText, style: AppTextStyle.redStyle(fontSize: 14)) : Container(),
        ],
      ),
    );
  }
}

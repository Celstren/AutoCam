import 'package:autocam/utils/general/app_colors.dart';
import 'package:autocam/utils/general/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppPasswordTextfield extends StatefulWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;

  AppPasswordTextfield(
      {Key key, this.hintText = "", this.controller, this.label = ""})
      : super(key: key);

  @override
  _AppPasswordTextfieldState createState() => _AppPasswordTextfieldState();
}

class _AppPasswordTextfieldState extends State<AppPasswordTextfield> {
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text(widget.label, style: AppTextStyle.blackStyle(fontSize: 18)),
        Container(
          width: MediaQuery.of(context).size.width * .8,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.PrimaryWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: widget.controller,
                obscureText: !visibility,
                style: AppTextStyle.darkGreyStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: AppTextStyle.darkGreyStyle(fontSize: 18),
                  border: InputBorder.none,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    child: Icon(
                        visibility ? Icons.visibility : Icons.visibility_off,
                        size: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

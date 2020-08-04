import 'package:autocam/models/service/service.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

class ServicesOption extends StatelessWidget {
  final Service service;
  final Function callback;

  const ServicesOption({
    Key key,
    this.service,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 150,
        width: 160,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(service.imagePath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.1,
                      0.4,
                      0.6,
                      0.9
                    ],
                    colors: [
                      AppColors.PrimaryGrey.withOpacity(.05),
                      AppColors.PrimaryGrey.withOpacity(.05),
                      AppColors.PrimaryDarkGrey.withOpacity(.25),
                      AppColors.PrimaryBlack.withOpacity(.5),
                    ]),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    service.title,
                    style: AppTextStyle.whiteStyle(
                        fontSize: AppFontSizes.SubTitle1,
                        fontFamily: AppFonts.Montserrat_Bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

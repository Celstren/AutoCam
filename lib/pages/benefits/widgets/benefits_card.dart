import 'package:autocam/models/benefit/benefit.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

class BenefitsCard extends StatelessWidget {
  final Benefit benefit;

  const BenefitsCard({Key key, this.benefit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30, left: MediaQuery.of(context).size.width * .1, right: MediaQuery.of(context).size.width * .1),
      decoration: BoxDecoration(
        color: AppColors.PrimaryWhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(color: AppColors.PrimaryGrey.withOpacity(.75), offset: Offset(3.0, 3.0)),
          //BoxShadow(color: AppColors.PrimaryGrey.withOpacity(.5), offset: Offset(0.0, 1.0)),
          //BoxShadow(color: AppColors.PrimaryGrey.withOpacity(.5), offset: Offset(1.0, 0.0)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              image: DecorationImage(image: AssetImage(benefit.imageURL), fit: BoxFit.fill)
            ),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(benefit.title, textAlign: TextAlign.start, style: AppTextStyle.blueStyle(fontSize: 14, fontFamily: AppFonts.Montserrat_Bold)),
                SizedBox(height: 10),
                Expanded(child: Text(benefit.description, textAlign: TextAlign.justify, style: AppTextStyle.darkGreyStyle(fontSize: 10))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
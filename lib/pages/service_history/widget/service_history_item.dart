import 'package:autocam/models/service_history/service_history.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceHistoryItem extends StatelessWidget {
  final ServiceHistory serviceHistory;
  const ServiceHistoryItem({Key key, this.serviceHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.PrimaryWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(color: AppColors.PrimaryBlack, offset: Offset(1.0, 1.0)),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(ServiceHistoryStrings.LicencePlate, style: AppTextStyle.blueStyle(fontSize: AppFontSizes.Text2, fontFamily: AppFonts.Montserrat_Bold)),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  child: Text(serviceHistory.licencePlate, textAlign: TextAlign.start, style: AppTextStyle.blueStyle(fontSize: AppFontSizes.Text2)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(ServiceHistoryStrings.ReceiveDate, style: AppTextStyle.blueStyle(fontSize: AppFontSizes.Text2, fontFamily: AppFonts.Montserrat_Bold)),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  child: Text(DateFormat("dd/MM/yyyy").format(serviceHistory.receiveDate), textAlign: TextAlign.start, style: AppTextStyle.blueStyle(fontSize: AppFontSizes.Text2)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(ServiceHistoryStrings.ShipDate, style: AppTextStyle.blueStyle(fontSize: AppFontSizes.Text2, fontFamily: AppFonts.Montserrat_Bold)),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  child: Text(DateFormat("dd/MM/yyyy").format(serviceHistory.shipDate), textAlign: TextAlign.start, style: AppTextStyle.blueStyle(fontSize: AppFontSizes.Text2)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(ServiceHistoryStrings.Status, style: AppTextStyle.blueStyle(fontSize: AppFontSizes.Text2, fontFamily: AppFonts.Montserrat_Bold)),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  child: Text(serviceHistory.status, textAlign: TextAlign.start, style: AppTextStyle.blueStyle(fontSize: AppFontSizes.Text2)),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(ServiceHistoryStrings.Description, style: AppTextStyle.blueStyle(fontSize: AppFontSizes.Text2, fontFamily: AppFonts.Montserrat_Bold)),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  child: Text(serviceHistory.description, textAlign: TextAlign.start, style: AppTextStyle.blueStyle(fontSize: AppFontSizes.Text2)),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
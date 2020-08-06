import 'package:autocam/models/car/car.dart';
import 'package:autocam/pages/car_registration/car_registration_page.dart';
import 'package:autocam/pages/car_registration/controller/car_registration_controller.dart';
import 'package:autocam/pages/navigation/methods/navigation_methods.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

class CarItem extends StatelessWidget {
  final Car car;
  const CarItem({Key key, this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CarRegistrationController().updateCar(car);
        pushWidget(context, CarRegistrationPage());
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: AppColors.PrimaryWhite,
          borderRadius: BorderRadius.circular(20),
          image: car.image != null
              ? DecorationImage(image: car.image, fit: BoxFit.fill)
              : null,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppColors.PrimaryBlack.withOpacity(.75),
                offset: Offset(5.0, 5.0),
                blurRadius: 5.0),
          ],
        ),
        child: Container(
          alignment:
              car.image != null ? Alignment.bottomCenter : Alignment.center,
          child: Text(car.licencePlate,
              style: AppTextStyle.blueStyle(
                  fontSize: AppFontSizes.Text2,
                  fontFamily: AppFonts.Montserrat_Bold)),
        ),
      ),
    );
  }
}

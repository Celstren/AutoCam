import 'dart:io';

import 'package:autocam/models/car/car.dart';
import 'package:autocam/pages/car_registration/controller/car_registration_controller.dart';
import 'package:autocam/utils/exports/app_common_widgets.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CarRegistrationAvatar extends StatelessWidget {
  const CarRegistrationAvatar({Key key}) : super(key: key);

  void pickImage(BuildContext context, ImageSource source) async {
    Navigator.pop(context);
    PickedFile image = await ImagePicker().getImage(source: source);
    Car car = CarRegistrationController().getCarValue();
    car.imageFile = File(image.path);
    CarRegistrationController().updateCar(car);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (_) => TwoOptionsDialog(
          leftOption: "Cámara",
          rightOption: "Galería",
          title: "Elige una opción",
          icon: Icons.folder,
          background: AppColors.PrimaryWhite,
          titleColor: AppColors.PrimaryBlue,
          leftOptionColor: AppColors.PrimaryBlue,
          leftOptionTextColor: AppColors.PrimaryWhite,
          rightOptionColor: AppColors.PrimaryBlue,
          rightOptionTextColor: AppColors.PrimaryWhite,
          onRightPress: () => pickImage(context, ImageSource.gallery),
          onLeftPress: () => pickImage(context, ImageSource.camera),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.PrimaryWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppColors.PrimaryBlack.withOpacity(.25),
                offset: Offset(1.5, 1.5),
                blurRadius: 2),
          ],
        ),
        child: StreamBuilder<Car>(
            stream: CarRegistrationController().getCarEvents(),
            builder: (BuildContext context, AsyncSnapshot<Car> carSnapshot) {
              switch (carSnapshot.connectionState) {
                case ConnectionState.none:
                  return Container();
                  break;
                case ConnectionState.waiting:
                  return Container();
                  break;
                case ConnectionState.active:
                  if (!carSnapshot.hasData || carSnapshot.data.image == null)
                    return Center(child: Icon(Icons.add_a_photo, size: 100));
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: carSnapshot.data.image, fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                  break;
                case ConnectionState.done:
                  return Container();
                  break;
                default:
                  return Container();
                  break;
              }
            }),
      ),
    );
  }
}

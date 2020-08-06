import 'dart:io';

import 'package:autocam/models/user/user.dart';
import 'package:autocam/utils/exports/app_common_widgets.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/global_controllers/global_controllers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends StatelessWidget {

  void pickImage(BuildContext context, ImageSource source) async {
    PickedFile image = await ImagePicker().getImage(source: source);
    User user = GlobalController().getUserProfileValue();
    user.imageFile = File(image.path);
    GlobalController().updateUserProfile(user);
    Navigator.pop(context);
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
            child: StreamBuilder<User>(
              stream: GlobalController().getUserProfileEvents(),
              builder: (BuildContext context, AsyncSnapshot<User> userSnapshot) {
              switch (userSnapshot.connectionState) {
                case ConnectionState.none:
                  return Container();
                  break;
                case ConnectionState.waiting:
                  return Container();
                  break;
                case ConnectionState.active:
                  return userSnapshot.hasData? AppAvatar(size: 120, user: userSnapshot.data) : Container();
                  break;
                case ConnectionState.done:
                  return Container();
                  break;
                default: 
                  return Container();
                  break;
              }
            }),
          );
  }
}
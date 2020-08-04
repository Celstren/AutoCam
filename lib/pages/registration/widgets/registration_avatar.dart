import 'dart:io';

import 'package:autocam/models/user/user.dart';
import 'package:autocam/utils/exports/app_common_widgets.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

class RegistrationAvatar extends StatefulWidget {
  RegistrationAvatar({Key key}) : super(key: key);

  @override
  _RegistrationAvatarState createState() => _RegistrationAvatarState();
}

class _RegistrationAvatarState extends State<RegistrationAvatar> {

  final BehaviorSubject<User> userStream = new BehaviorSubject<User>.seeded(User());

  void pickImage(BuildContext context, ImageSource source) async {
    PickedFile image = await ImagePicker().getImage(source: source);
    User user = userStream.value;
    user.imageFile = File(image.path);
    userStream.add(user);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    userStream.close();
    super.dispose();
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
              stream: userStream,
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
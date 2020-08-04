import 'package:autocam/models/user/user.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  final double size;
  final User user;

  const AppAvatar({Key key, this.size = 30, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: AppColors.PrimaryWhite,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: _buildImage(),
          ),
        ),
        Container(
          height: size,
          width: size,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: size * .25,
              width: size * .25,
              decoration: BoxDecoration(
                color: AppColors.PrimaryWhite,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.edit, color: AppColors.PrimaryBlack, size: size * .125),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildImage() {
    if (user != null) {
      if (user.hasValidImage) {
        return CachedNetworkImage(
          imageUrl: user.imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            height: size * .9,
            width: size * .9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
            ),
          ),
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(
              strokeWidth: 4,
              value: downloadProgress.progress,
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(Icons.error, size: 20),
          ),
        );
      }
      return Container(
        height: size * .9,
        width: size * .9,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: user.image, fit: BoxFit.fill),
        ),
      );
    }
    return Container();
  }
}

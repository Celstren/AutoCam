import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

class WorkshopPage extends StatefulWidget {
  WorkshopPage({Key key}) : super(key: key);

  @override
  _WorkshopPageState createState() => _WorkshopPageState();
}

class _WorkshopPageState extends State<WorkshopPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.PrimaryWhite,
      ),
      child: Placeholder(),
    );
  }
}
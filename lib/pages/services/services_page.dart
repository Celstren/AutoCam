import 'package:autocam/models/service/service.dart';
import 'package:autocam/pages/navigation/home_navigation/home_navigation_controller.dart';
import 'package:autocam/pages/services/widget/services_option.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/exports/app_navigation.dart';
import 'package:autocam/utils/helpers/remove_over_scroll_glow.dart';
import 'package:flutter/material.dart';

final List<Service> services = [
    Service(
      id: 0,
      title: ServicesStrings.Corrective,
      title2: ServicesStrings.Corrective2,
      imagePath: AppImages.Corrective,
      description: ServicesStrings.CorrectiveDescription,
    ),
    Service(
      id: 1,
      title: ServicesStrings.Preventive,
      title2: ServicesStrings.Preventive2,
      imagePath: AppImages.Preventive,
      description: ServicesStrings.PreventiveDescription,
    ),
    Service(
      id: 2,
      title: ServicesStrings.Replacement,
      title2: ServicesStrings.Replacement2,
      imagePath: AppImages.Replacement,
      description: ServicesStrings.ReplacementDescription,
    ),
    Service(
      id: 3,
      title: ServicesStrings.BodyWorkPainting,
      title2: ServicesStrings.BodyWorkPainting2,
      imagePath: AppImages.BodyWorkPainting,
      description: ServicesStrings.BodyWorkPaintingDescription,
    ),
    Service(
      id: 4,
      title: ServicesStrings.GasConversion,
      title2: ServicesStrings.GasConversion2,
      imagePath: AppImages.GasConversion,
      description: ServicesStrings.GasConversionDescription,
    ),
    Service(
      id: 5,
      title: ServicesStrings.Accessories,
      title2: ServicesStrings.Accessories2,
      imagePath: AppImages.Accessories,
      description: ServicesStrings.AccessoriesDescription,
    ),
  ];

class ServicesPage extends StatefulWidget {
  ServicesPage({Key key}) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {

  void displayBenefitSelected(Service service) {
    HomeNavigationController().updateServiceSelected(service);
    HomeNavigationController().updateHomeNavigationTab(HomeNavigationTabs.services_selected);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.PrimaryBlue),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.PrimaryWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: ScrollConfiguration(
          behavior: RemoveOverScrollGlow(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 60),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ServicesOption(service: services[0], callback: () => displayBenefitSelected(services[0])),
                      ServicesOption(service: services[1], callback: () => displayBenefitSelected(services[1])),
                    ]),
                SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ServicesOption(service: services[2], callback: () => displayBenefitSelected(services[2])),
                      ServicesOption(service: services[3], callback: () => displayBenefitSelected(services[3])),
                    ]),
                SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ServicesOption(service: services[4], callback: () => displayBenefitSelected(services[4])),
                      ServicesOption(service: services[5], callback: () => displayBenefitSelected(services[5])),
                    ]),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

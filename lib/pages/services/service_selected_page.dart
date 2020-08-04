import 'package:autocam/models/service/service.dart';
import 'package:autocam/utils/exports/app_common_widgets.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/exports/app_navigation.dart';
import 'package:autocam/utils/helpers/remove_over_scroll_glow.dart';
import 'package:flutter/material.dart';

class ServiceSelectedPage extends StatelessWidget {
  const ServiceSelectedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: StreamBuilder<Service>(
      stream: HomeNavigationController().getServiceSelectedEvents(),
      builder: (BuildContext context,
          AsyncSnapshot<Service> serviceSelectedSnapshot) {
        switch (serviceSelectedSnapshot.connectionState) {
          case ConnectionState.none:
            return Container();
            break;
          case ConnectionState.waiting:
            return Container();
            break;
          case ConnectionState.active:
            return _buildContent(context, serviceSelectedSnapshot.data ?? Service());
            break;
          case ConnectionState.done:
            return Container();
            break;
          default:
            return Container();
            break;
        }
      },
    ), onWillPop: () async {
      HomeNavigationController().updateHomeNavigationTab(HomeNavigationTabs.services);
      return false;
    });
  }

  Widget _buildContent(BuildContext context, Service service) {
      return Container(
          color: AppColors.PrimaryWhite,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .45,
                width: MediaQuery.of(context).size.width,
                child: Image(
                    image: AssetImage(service.imagePath), fit: BoxFit.fill),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                        height:
                            (MediaQuery.of(context).size.height * .45) - 20),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.PrimaryWhite,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 30),
                            Expanded(
                              child: ScrollConfiguration(
                                behavior: RemoveOverScrollGlow(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Text(service.title2,
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle.blueStyle(
                                              fontSize: 20,
                                              fontFamily:
                                                  AppFonts.Montserrat_Bold)),
                                      SizedBox(height: 30),
                                      Text(service.description,
                                          textAlign: TextAlign.justify,
                                          style: AppTextStyle.blueStyle(
                                              fontSize: 20)),
                                      SizedBox(height: 50),
                                      Container(
                                        height: 50,
                                        width: 300,
                                        child: AppButton(
                                        callback: () => HomeNavigationController().updateHomeNavigationTab(HomeNavigationTabs.book_center),
                                            backgroundColor:
                                                AppColors.PrimaryBlue,
                                            text:
                                                ServicesStrings.BookReservation,
                                            style: AppTextStyle.whiteStyle(
                                                fontSize: 14),
                                                ),
                                      ),
                                      SizedBox(height: 30),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
    }
}

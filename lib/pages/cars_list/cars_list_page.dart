import 'package:autocam/models/car/car.dart';
import 'package:autocam/models/user/user.dart';
import 'package:autocam/pages/car_registration/car_registration_page.dart';
import 'package:autocam/pages/cars_list/widgets/car_item.dart';
import 'package:autocam/pages/navigation/methods/navigation_methods.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/global_controllers/global_controllers.dart';
import 'package:flutter/material.dart';

class CarsListPage extends StatefulWidget {
  CarsListPage({Key key}) : super(key: key);

  @override
  _CarsListPageState createState() => _CarsListPageState();
}

class _CarsListPageState extends State<CarsListPage> {
  List<Widget> _buildCars(List<Car> cars) =>
      cars.map((e) => CarItem(car: e)).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            child: Center(
              child: FlatButton(
                onPressed: () => pushWidget(context, CarRegistrationPage()),
                child: Text(
                  "+ Agregar Nueva Unidad",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.blueStyle(
                    fontSize: AppFontSizes.SubTitle1,
                    fontFamily: AppFonts.Montserrat_Bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: StreamBuilder<User>(
                stream: GlobalController().getUserEvents(),
                builder:
                    (BuildContext context, AsyncSnapshot<User> userSnapshot) {
                  switch (userSnapshot.connectionState) {
                    case ConnectionState.none:
                      return Container();
                      break;
                    case ConnectionState.waiting:
                      return Container();
                      break;
                    case ConnectionState.active:
                      if (userSnapshot.data.cars == null ||
                          userSnapshot.data.cars == []) return Container();
                      return Wrap(
                        children: _buildCars(userSnapshot.data.cars),
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
        ],
      ),
    );
  }
}

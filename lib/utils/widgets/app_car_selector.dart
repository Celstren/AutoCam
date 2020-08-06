import 'package:autocam/models/car/car.dart';
import 'package:autocam/models/user/user.dart';
import 'package:autocam/pages/car_registration/car_registration_page.dart';
import 'package:autocam/pages/car_registration/controller/car_registration_controller.dart';
import 'package:autocam/pages/navigation/methods/navigation_methods.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/global_controllers/global_controllers.dart';
import 'package:flutter/material.dart';

class AppCarSelector extends StatefulWidget {
  final int styleType;
  AppCarSelector({Key key, this.styleType = 0}) : super(key: key);

  @override
  _AppCarSelectorState createState() => _AppCarSelectorState();
}

class _AppCarSelectorState extends State<AppCarSelector> {
  List<Car> cars = [];
  Car carSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      decoration: BoxDecoration(
        color: AppColors.PrimaryWhite,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<User>(
            stream: GlobalController().getUserEvents(),
            builder: (BuildContext context, AsyncSnapshot<User> userSnapshot) {
              switch (userSnapshot.connectionState) {
                case ConnectionState.none:
                  return Container();
                  break;
                case ConnectionState.waiting:
                  return Container();
                  break;
                case ConnectionState.active:
                  {
                    cars = userSnapshot.data?.cars ?? [];
                    if (carSelected == null) {
                      carSelected = cars.isNotEmpty ? cars.first : null;
                    }
                    return _buildCarsDropdown();
                  }
                  break;
                case ConnectionState.done:
                  return Container();
                  break;
                default:
                  return Container();
                  break;
              }
            },
          ),
          _buildAddMore(),
        ],
      ),
    );
  }

  Widget _buildCarsDropdown() {
    return cars.isNotEmpty
        ? Container(
          width: 150,
          height: 30,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Car>(
              isExpanded: true,
              value: carSelected,
              icon: Icon(Icons.keyboard_arrow_down, color: AppColors.PrimaryBlue),
              iconSize: 24,
              elevation: 16,
              onChanged: (Car newValue) {
                setState(() {
                  GlobalController().updateCarSelected(newValue);
                  carSelected = newValue;
                });
              },
              items: cars.map<DropdownMenuItem<Car>>((Car value) {
                return DropdownMenuItem<Car>(
                  value: value,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(color: AppColors.PrimaryWhite),
                    child:
                        Text(value.licencePlate, style: AppTextStyle.blueStyle(fontSize: AppFontSizes.SubTitle1, fontFamily: AppFonts.Montserrat_Bold)),
                  ),
                );
              }).toList(),
            ),
          ),
        )
        : Container();
  }

  Widget _buildAddMore() {
    return FlatButton(
      onPressed: () {
        CarRegistrationController().updateCar(Car());
        pushWidget(context, CarRegistrationPage());
      },
      child: Text(
        "+ Agregar Nueva Unidad",
        textAlign: TextAlign.center,
        style: AppTextStyle.blueStyle(
          fontSize: AppFontSizes.SubTitle1,
          fontFamily: AppFonts.Montserrat_Bold,
        ),
      ),
    );
  }
}

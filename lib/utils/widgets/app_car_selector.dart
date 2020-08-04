import 'package:autocam/models/car/car.dart';
import 'package:autocam/models/user/user.dart';
import 'package:autocam/pages/car_registration/car_registration_page.dart';
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
                    carSelected = cars.isNotEmpty ? cars.first : null;
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
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              style: AppTextStyle.blackStyle(fontSize: AppFontSizes.Text),
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
                        Text(value.licencePlate, style: AppTextStyle.blackStyle()),
                  ),
                );
              }).toList(),
            ),
          ),
        )
        : Container();
  }

  Widget _buildAddMore() {
    TextStyle style = AppTextStyle.whiteStyle(
      fontSize: AppFontSizes.SubTitle1,
      fontFamily: AppFonts.Montserrat_Bold,
    );

    switch (widget.styleType) {
      case 0:
        style = AppTextStyle.whiteStyle(
          fontSize: AppFontSizes.SubTitle1,
          fontFamily: AppFonts.Montserrat_Bold,
        );
        break;
      case 1:
        style = AppTextStyle.blueStyle(
          fontSize: AppFontSizes.SubTitle1,
          fontFamily: AppFonts.Montserrat_Bold,
        );
        break;
      default:
        style = AppTextStyle.whiteStyle(
          fontSize: AppFontSizes.SubTitle1,
          fontFamily: AppFonts.Montserrat_Bold,
        );
        break;
    }

    return FlatButton(
      onPressed: () => pushWidget(context, CarRegistrationPage()),
      child: Text(
        "+ Agregar Nueva Unidad",
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}

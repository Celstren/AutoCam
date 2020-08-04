import 'package:autocam/models/car/car.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/helpers/remove_over_scroll_glow.dart';
import 'package:flutter/material.dart';

class SOSPage extends StatefulWidget {
  SOSPage({Key key}) : super(key: key);

  @override
  _SOSPageState createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
  List<Car> cars = [
    Car(
        email: "postventa@autocam.com.pe",
        phone: "998 222 333",
        licencePlate: "ASD-859"),
  ];
  Car carSelected;

  @override
  void initState() {
    carSelected = cars.isNotEmpty ? cars.first : Car();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.PrimaryBlue,
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.pop(context),
                      child: Icon(Icons.close,
                          size: 30, color: AppColors.PrimaryWhite),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: RemoveOverScrollGlow(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30),
                        Text(
                          SOSStrings.Contact,
                          style: AppTextStyle.whiteStyle(
                              fontSize: AppFontSizes.Title1,
                              fontFamily: AppFonts.Montserrat_Bold),
                        ),
                        SizedBox(height: 50),
                        _buildDropdown(),
                        SizedBox(height: 10),
                        _buildContactField(
                            label: SOSStrings.Email,
                            value: carSelected.email,
                            iconData: Icons.email),
                        SizedBox(height: 10),
                        _buildContactField(
                            label: SOSStrings.Phone,
                            value: carSelected.phone,
                            iconData: Icons.phone_in_talk),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.PrimaryWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<Car>(
        isExpanded: true,
        value: carSelected,
        dropdownColor: AppColors.PrimaryWhite,
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        elevation: 16,
        style: AppTextStyle.blackStyle(fontSize: AppFontSizes.Text),
        underline: Container(
          height: 2,
          color: AppColors.PrimaryWhite,
        ),
        onChanged: (Car newValue) {
          setState(() {
            carSelected = newValue;
          });
        },
        items: cars.map<DropdownMenuItem<Car>>((Car value) {
          return DropdownMenuItem<Car>(
            value: value,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: AppColors.PrimaryWhite),
              child: Text(value.licencePlate, style: AppTextStyle.blackStyle()),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContactField(
      {String label = "", String value = "", IconData iconData = Icons.email}) {
    return Container(
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.PrimaryWhite,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      label,
                      textAlign: TextAlign.start,
                      style:
                          AppTextStyle.greyStyle(fontSize: AppFontSizes.Text),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        value,
                        textAlign: TextAlign.start,
                        style: AppTextStyle.blueStyle(
                            fontSize: AppFontSizes.Text,
                            fontFamily: AppFonts.Montserrat_Bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            width: 50,
            child: Icon(iconData, size: 20, color: AppColors.PrimaryWhite),
          ),
        ],
      ),
    );
  }
}

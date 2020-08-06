import 'package:autocam/models/car/car.dart';
import 'package:autocam/pages/service_history/filter/filter_controller.dart';
import 'package:autocam/pages/service_history/filter/service_history_filter.dart';
import 'package:autocam/utils/exports/app_common_widgets.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/global_controllers/global_controllers.dart';
import 'package:autocam/utils/helpers/remove_over_scroll_glow.dart';
import 'package:flutter/material.dart';

class ServiceFilterPage extends StatefulWidget {
  ServiceFilterPage({Key key}) : super(key: key);

  @override
  _ServiceFilterPageState createState() => _ServiceFilterPageState();
}

class _ServiceFilterPageState extends State<ServiceFilterPage> {
  List<Car> cars = [];
  Car carSelected;
  List<String> status = ["Todos", "Activo", "Inactivo"];
  String statusSelected = "Todos";
  ServiceHistoryFilter filter = ServiceHistoryFilter();

  @override
  void initState() {
    filter = FilterController().getServiceFilterValue() ?? ServiceHistoryFilter();
    cars = [Car(licencePlate: "Todos")];
    if (GlobalController().getUserValue()?.cars != null) cars.addAll(GlobalController().getUserValue()?.cars);
    carSelected = cars.first;
    super.initState();
  }

  Widget _buildCarsDropdown() {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.PrimaryWhite,
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Car>(
          isExpanded: true,
          value: carSelected,
          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.PrimaryBlue),
          iconSize: 24,
          elevation: 16,
          onChanged: (Car newValue) {
            setState(() {
              carSelected = newValue;
              filter.licencePlate = newValue.licencePlate;
            });
          },
          items: cars.map<DropdownMenuItem<Car>>((Car value) {
            return DropdownMenuItem<Car>(
              value: value,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: AppColors.PrimaryWhite),
                child: Text(value.licencePlate,
                    style: AppTextStyle.blueStyle(
                        fontSize: AppFontSizes.SubTitle1,
                        fontFamily: AppFonts.Montserrat_Bold)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildStatusDropdown() {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.PrimaryWhite,
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: statusSelected,
          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.PrimaryBlue),
          iconSize: 24,
          elevation: 16,
          onChanged: (String newValue) {
            setState(() {
              statusSelected = newValue;
              filter.status = newValue;
            });
          },
          items: status.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: AppColors.PrimaryWhite),
                child: Text(value,
                    style: AppTextStyle.blueStyle(
                        fontSize: AppFontSizes.SubTitle1,
                        fontFamily: AppFonts.Montserrat_Bold)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.PrimaryBlue,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Icon(Icons.close,
                        size: 40, color: AppColors.PrimaryWhite),
                  ),
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: RemoveOverScrollGlow(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(ServiceFilterStrings.Title,
                                  style: AppTextStyle.whiteStyle(
                                      fontSize: AppFontSizes.Title1,
                                      fontFamily: AppFonts.Montserrat_Bold)),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  ServiceFilterStrings.ChooseCar,
                                  style: AppTextStyle.whiteStyle(
                                      fontSize: AppFontSizes.Text2),
                                ),
                                SizedBox(height: 10),
                                _buildCarsDropdown(),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: AppTwoDateTextField(
                              width: MediaQuery.of(context).size.width * .8,
                              labelStyle: AppTextStyle.whiteStyle(
                                  fontSize: AppFontSizes.Text2),
                              initialStartValue: filter.startReceiveDate,
                              initialEndValue: filter.endReceiveDate,
                              label: ServiceFilterStrings.ReceiveDate,
                              showBorder: true,
                              onChangeStart: (date) {
                                setState(() {
                                  filter.startReceiveDate = date;
                                });
                              },
                              onChangeEnd: (date) {
                                setState(() {
                                  filter.endReceiveDate = date;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: AppTwoDateTextField(
                              width: MediaQuery.of(context).size.width * .8,
                              labelStyle: AppTextStyle.whiteStyle(
                                  fontSize: AppFontSizes.Text2),
                              initialStartValue: filter.startShipDate,
                              initialEndValue: filter.endShipDate,
                              label: ServiceFilterStrings.ShiPDate,
                              showBorder: true,
                              onChangeStart: (date) {
                                setState(() {
                                  filter.startShipDate = date;
                                });
                              },
                              onChangeEnd: (date) {
                                setState(() {
                                  filter.endShipDate = date;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  ServiceFilterStrings.Status,
                                  style: AppTextStyle.whiteStyle(
                                      fontSize: AppFontSizes.Text2),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: _buildStatusDropdown(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * .8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.PrimaryWhite, width: 3)),
                            child: AppButton(
                              text: "Aplicar",
                              backgroundColor: AppColors.PrimaryBlue,
                              callback: () => FilterController()
                                  .updateServiceFilter(filter),
                              style: AppTextStyle.whiteStyle(
                                  fontSize: AppFontSizes.Title1,
                                  fontFamily: AppFonts.Montserrat_Bold),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
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
}

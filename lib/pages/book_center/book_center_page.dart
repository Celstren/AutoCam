import 'package:autocam/models/local/local.dart';
import 'package:autocam/models/service/service.dart';
import 'package:autocam/pages/navigation/home_navigation/home_navigation_controller.dart';
import 'package:autocam/pages/services/services_page.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/general/app_function.dart';
import 'package:autocam/utils/helpers/remove_over_scroll_glow.dart';
import 'package:autocam/utils/widgets/app_car_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayFormat;

class BookCenterPage extends StatefulWidget {
  @override
  _BookCenterPageState createState() => _BookCenterPageState();
}

class _BookCenterPageState extends State<BookCenterPage> {
  Service serviceSelected;

  DateTime _currentDate = DateTime.now();
  List<Local> locals = [
    Local(
      id: 0,
      address: "Camacho - Av. Javier Prado 5430",
      schedule: ["15:30", "16:00", "16:30"],
    ),
    Local(
      id: 1,
      address: "Camacho - Av. Angamos 1240",
      schedule: ["05:30", "06:00", "06:30"],
    ),
  ];

  Local localSelected;
  String scheduleSelected;

  @override
  void initState() {
    localSelected = locals.first;
    scheduleSelected = localSelected.schedule.first;
    Service previousService =
        HomeNavigationController().getServiceSelectedValue();
    if (previousService.id != null) {
      serviceSelected = previousService;
    } else {
      serviceSelected = services.first;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.PrimaryBlue),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          color: AppColors.PrimaryWhite,
        ),
        child: ScrollConfiguration(
          behavior: RemoveOverScrollGlow(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildCalendar(),
                SizedBox(height: 30),
                _buildAddCar(),
                SizedBox(height: 10),
                _buildService(),
                SizedBox(height: 10),
                _buildLocation(),
                SizedBox(height: 10),
                _buildSchedule(),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddCar() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text(BookCenterStrings.Car, style: AppTextStyle.blueStyle(fontSize: AppFontSizes.SubTitle1))),
          AppCarSelector(styleType: 1),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return CalendarCarousel<Event>(
      locale: "es",
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
      },
      weekendTextStyle: TextStyle(
        color: AppColors.PrimaryBlue,
      ),
      weekFormat: false,
      height: AppFunctions.getOrientationDimension(context,
          portraitDim: 450, landscapeDim: 640),
      headerTextStyle: AppTextStyle.blueStyle(
          fontSize: AppFontSizes.Title1, fontFamily: AppFonts.Montserrat_Bold),
      selectedDateTime: _currentDate,
      daysHaveCircularBorder: true,
      isScrollable: false,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      weekdayTextStyle: AppTextStyle.blueStyle(
          fontSize: AppFontSizes.Text, fontFamily: AppFonts.Montserrat_Bold),
      weekDayFormat: WeekdayFormat.standaloneNarrow,
      todayBorderColor: AppColors.PrimaryWhite,
      todayButtonColor: AppColors.PrimaryWhite,
      selectedDayBorderColor: AppColors.PrimaryWhite,
      selectedDayButtonColor: AppColors.PrimaryBlue,
      selectedDayTextStyle: AppTextStyle.whiteStyle(
          fontSize: AppFontSizes.Text, fontFamily: AppFonts.Montserrat_Bold),
      todayTextStyle: AppTextStyle.blueStyle(
          fontSize: AppFontSizes.Text, fontFamily: AppFonts.Montserrat_Bold),
      daysTextStyle: AppTextStyle.blueStyle(
          fontSize: AppFontSizes.Text, fontFamily: AppFonts.Montserrat_Bold),
    );
  }

  Widget _buildLocation() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            BookCenterStrings.Location,
            style: AppTextStyle.blueStyle(fontSize: AppFontSizes.SubTitle1),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: AppColors.PrimaryWhite,
              border: Border.all(color: AppColors.PrimaryBlue, width: 3),
              borderRadius: BorderRadius.circular(50),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Local>(
                isExpanded: true,
                value: localSelected,
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 24,
                elevation: 16,
                style: AppTextStyle.blackStyle(fontSize: AppFontSizes.Text),
                onChanged: (Local newValue) {
                  setState(() {
                    localSelected = newValue;
                    scheduleSelected = newValue.schedule.first;
                  });
                },
                items: locals.map<DropdownMenuItem<Local>>((Local value) {
                  return DropdownMenuItem<Local>(
                    value: value,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(color: AppColors.PrimaryWhite),
                      child:
                          Text(value.address, style: AppTextStyle.blackStyle()),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSchedule() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            BookCenterStrings.Schedule,
            style: AppTextStyle.blueStyle(fontSize: AppFontSizes.SubTitle1),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.PrimaryBlue, width: 2),
              color: AppColors.PrimaryWhite,
              borderRadius: BorderRadius.circular(50),
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
              isExpanded: true,
              value: scheduleSelected,
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              style: AppTextStyle.blackStyle(fontSize: AppFontSizes.Text),
              onChanged: (String newValue) {
                setState(() {
                  scheduleSelected = newValue;
                });
              },
              items: localSelected.schedule
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(color: AppColors.PrimaryWhite),
                    child: Text(value, style: AppTextStyle.blackStyle()),
                  ),
                );
              }).toList(),
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildService() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: AppColors.PrimaryWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            BookCenterStrings.Service,
            style: AppTextStyle.blueStyle(fontSize: AppFontSizes.SubTitle1),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.PrimaryBlue, width: 3),
                borderRadius: BorderRadius.circular(50),
                color: AppColors.PrimaryWhite),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Service>(
                isExpanded: true,
                value: serviceSelected,
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 24,
                elevation: 16,
                style: AppTextStyle.blackStyle(fontSize: AppFontSizes.Text),
                onChanged: (Service newValue) {
                  setState(() {
                    serviceSelected = newValue;
                  });
                },
                items: services.map<DropdownMenuItem<Service>>((Service value) {
                  return DropdownMenuItem<Service>(
                    value: value,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(color: AppColors.PrimaryWhite),
                      child:
                          Text(value.title, style: AppTextStyle.blackStyle()),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

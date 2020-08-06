import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppTwoDateTextField extends StatefulWidget {
  final DateTime initialStartValue;
  final DateTime initialEndValue;
  final String label;
  final bool showBorder;
  final bool enabled;
  @required
  final Function(DateTime) onChangeStart;
  @required
  final Function(DateTime) onChangeEnd;
  final double width;
  final TextStyle labelStyle;
  final TextStyle textfieldStyle;
  final Color textfieldColor;

  AppTwoDateTextField({
    Key key,
    this.initialStartValue,
    this.initialEndValue,
    this.label = "",
    this.showBorder = false,
    this.enabled = true,
    this.onChangeStart,
    this.onChangeEnd,
    this.width = 100, 
    this.labelStyle, 
    this.textfieldStyle,
    this.textfieldColor,
  }) : super(key: key);

  @override
  _AppTwoDateTextFieldState createState() => _AppTwoDateTextFieldState();
}

class _AppTwoDateTextFieldState extends State<AppTwoDateTextField> {
  String _startValue = "", _endValue = "";

  @override
  void initState() {
    _startValue = DateFormat("dd/MM/yyyy").format(widget.initialStartValue ?? DateTime.now());
    _endValue = DateFormat("dd/MM/yyyy").format(widget.initialEndValue ?? DateTime.now());
    super.initState();
  }

  void updateStartValue(DateTime date) {
    setState(() {
      _startValue = DateFormat("dd/MM/yyyy").format(date);
      widget.onChangeStart(date);
    });
  }

  void updateEndValue(DateTime date) {
    setState(() {
      _endValue = DateFormat("dd/MM/yyyy").format(date);
      widget.onChangeEnd(date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.label, style: widget.labelStyle ?? AppTextStyle.blackStyle(fontSize: 18)),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                showDatePicker(
                  locale: new Locale("es"),
                  helpText: "",
                  context: context,
                  initialDate: widget.initialStartValue,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                ).then(updateStartValue);
              },
              child: Container(
                width: widget.width ?? MediaQuery.of(context).size.width * .8,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: widget.textfieldColor ?? AppColors.PrimaryWhite,
                  borderRadius: BorderRadius.circular(10),
                  border: widget.showBorder
                      ? Border.all(color: AppColors.PrimaryBlack, width: 1)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _startValue,
                      style: widget.textfieldStyle ?? AppTextStyle.darkGreyStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                showDatePicker(
                  locale: new Locale("es"),
                  helpText: "",
                  context: context,
                  initialDate: widget.initialEndValue,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                ).then(updateEndValue);
              },
              child: Container(
                width: widget.width ?? MediaQuery.of(context).size.width * .8,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: widget.textfieldColor ?? AppColors.PrimaryWhite,
                  borderRadius: BorderRadius.circular(10),
                  border: widget.showBorder
                      ? Border.all(color: AppColors.PrimaryBlack, width: 1)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _endValue,
                      style: widget.textfieldStyle ?? AppTextStyle.darkGreyStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}

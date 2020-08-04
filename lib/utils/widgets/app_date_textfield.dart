import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDateTextField extends StatefulWidget {
  final DateTime initialValue;
  final String label;
  final bool showBorder;
  final bool enabled;
  @required
  final Function(DateTime) onChange;

  AppDateTextField({
    Key key,
    this.initialValue,
    this.label = "",
    this.showBorder = false,
    this.enabled = true,
    this.onChange,
  }) : super(key: key);

  @override
  _AppDateTextFieldState createState() => _AppDateTextFieldState();
}

class _AppDateTextFieldState extends State<AppDateTextField> {
  String _value = "";

  @override
  void initState() {
    _value =
        DateFormat("yyyy/MM/dd").format(widget.initialValue ?? DateTime.now());
    super.initState();
  }

  void updateValue(DateTime date) {
    setState(() {
      _value = DateFormat("yyyy/MM/dd").format(date);
      widget.onChange(date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.label, style: AppTextStyle.blackStyle(fontSize: 18)),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                showDatePicker(
                  context: context,
                  initialDate: widget.initialValue,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                ).then(updateValue);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.PrimaryWhite,
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
                      _value,
                      style: AppTextStyle.darkGreyStyle(fontSize: 18),
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

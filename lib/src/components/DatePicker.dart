import 'dart:async';

import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  final Function(DateTime) onDateSelected;

  DatePicker(
      {Key key,
      @required this.initialDate,
      @required this.onDateSelected,
      DateTime firstDate,
      DateTime lastDate})
      : this.firstDate = firstDate ?? DateTime(1920),
        this.lastDate = lastDate ?? DateTime.now(),
        super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  Future<void> _showPicker(context) async {
    DateTime dateSelected = await showDatePicker(
      context: context,
      initialDate: this.widget.initialDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      initialDatePickerMode: DatePickerMode.year,
    );

    if (dateSelected != null) {
      setState(() {
        _selectedDate = dateSelected;
      });
    }

    this.widget.onDateSelected(dateSelected);
  }

  @override
  Widget build(BuildContext context) {
    Widget _wrapper(Widget child) => Container(
          child: child,
          padding: EdgeInsets.symmetric(vertical: 15.0),
        );

    return ElevatedButton.icon(
      icon: _wrapper(Icon(
        Icons.calendar_today_outlined,
        color: MyColors.accentColor,
      )),
      label: _wrapper(Text(
        "${DateFormat('dd-MM-yyyy').format(_selectedDate)}",
        style: TextStyle(fontSize: 20, color: MyColors.accentColor),
      )),
      onPressed: () {
        _showPicker(context);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(width: 2.0, color: MyColors.accentColor),
        ),
      ),
    );
  }
}

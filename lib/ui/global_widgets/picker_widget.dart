import 'package:flutter/material.dart';

class PickerWidgets {
  static showDatePickerDialog(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime(2020, 11, 17),
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
  }

  // Call when you want the date time range picker to be shown
  static showDateRangePickerDialog(BuildContext context) async {
    return await showDateRangePicker(
      context: context,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
  }

  // Call when you want to show the time picker
  static showTimePickerDialog(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime(2020, 11, 17),
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
  }
}

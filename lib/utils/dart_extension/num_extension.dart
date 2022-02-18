import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Num extension to extend List functionality
extension NumExtension on num {
  /// Add suffix to the number
  String suffix([String suffix = '']) {
    if (suffix.isNotEmpty) return '${this}$suffix';
    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
    }
    return '${this}th';
  }

  ///Creates a fixed sized square box.
  SizedBox sq(Widget child) =>
      _sizedBox(child: child, h: toDouble().h, w: toDouble().w);

  ///Creates a fixed sized height box.
  SizedBox szh() => _sizedBox(h: toDouble().h);

  ///Creates a fixed sized width box.
  SizedBox szw() => _sizedBox(w: toDouble().w);

  // Created a fixed sized height box with child
  SizedBox szhc(Widget child) =>
      _sizedBox(child: child, h: toDouble().h, w: toDouble().w);

// Created a fixed sized width box with child
  SizedBox szwc(Widget child) =>
      _sizedBox(child: child, h: toDouble().h, w: toDouble().w);

  SizedBox _sizedBox({Widget? child, double? h, double? w}) =>
      SizedBox(child: child, height: h, width: w);

  ///Returns Duration of this in seconds.
  Duration get seconds => Duration(seconds: this as int);

  ///Returns Duration of this in milliseconds.
  Duration get milliseconds => Duration(milliseconds: this as int);

  ///Returns Duration of this in microseconds.
  Duration get microseconds => Duration(microseconds: this as int);

  ///Returns Duration of this in minutes.
  Duration get minutes => Duration(minutes: this as int);

  ///Returns Duration of this in hours.
  Duration get hours => Duration(hours: this as int);

  ///Returns Duration of this in days.
  Duration get days => Duration(days: this as int);
}

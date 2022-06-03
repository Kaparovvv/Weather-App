import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormattingHelper {
  getGradusFormat(var value) {
    double gradus = value - 273.15;
    return gradus.toStringAsFixed(0);
  }

  getDateYearFormat(dynamic value) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(value * 1000);
    var date = DateFormat('dd.MMMM.yyyy').format(dateTime);
    return date;
  }
  getDateHoursFormat(dynamic value) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(value * 1000);
    var time = DateFormat('HH:mm').format(dateTime);
    return time;
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Size size(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return size;
}

String formattedDate(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

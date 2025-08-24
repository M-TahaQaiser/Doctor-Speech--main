import 'package:TinyDragonTherapy/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  const CustomDivider({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.1,
      color: color ?? kDividerColor,
    );
  }
}

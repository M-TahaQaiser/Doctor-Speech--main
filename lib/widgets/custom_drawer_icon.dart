import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawerIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomDrawerIcon({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset('assets/images/hamburger-icon.svg'),
      onPressed: onPressed,
    );
  }
}

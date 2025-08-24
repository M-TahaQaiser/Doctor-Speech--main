import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle get headingStyle => GoogleFonts.catamaran(
        fontSize: 26.sp, // Default font size
        color: const Color(0xff39434F),
        fontWeight: FontWeight.w700,
      );
  static TextStyle get basicStyle => GoogleFonts.catamaran(
        fontSize: 16.sp, // Default font size
        color: const Color(0xff808B9A),
        fontWeight: FontWeight.w600,
      );
}

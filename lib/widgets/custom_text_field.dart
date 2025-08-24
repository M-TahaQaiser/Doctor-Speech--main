import 'package:flutter/material.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? ispass;
  final int? maxLines, minLines;
  const CustomTextField({
    super.key,
    this.controller,
    required this.hint,
    this.suffixIcon,
    this.ispass,
    this.prefixIcon,
    this.maxLines,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      controller: controller,
      style: CustomTextStyle.basicStyle.copyWith(fontSize: 12.sp),
      obscureText: ispass ?? false,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: CustomTextStyle.basicStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          borderSide: const BorderSide(
            color: Color(0xff8F8F8F),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          borderSide: const BorderSide(
            color: Color(0xff8F8F8F),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          borderSide: const BorderSide(
            color: Color(0xff8F8F8F),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          borderSide: const BorderSide(
            color: Color(0xff8F8F8F),
          ),
        ),
        suffixIcon: suffixIcon, // Add suffix icon here
        prefixIcon: prefixIcon,
      ),
    );
  }
}

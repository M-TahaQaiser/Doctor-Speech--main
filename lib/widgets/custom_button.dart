import 'package:TinyDragonTherapy/themes/colors.dart';
import 'package:TinyDragonTherapy/util/custom_testyle.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';

class PrimaryButton extends StatelessWidget {
  final double? height, width;
  final String title;
  final void Function()? onTap;
  const PrimaryButton(
      {super.key, required this.title, this.onTap, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 54.h,
        width: width ?? 327.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kPrimaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: CustomTextStyle.basicStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

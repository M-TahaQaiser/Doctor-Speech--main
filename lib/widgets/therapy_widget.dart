import 'package:TinyDragonTherapy/util/export_all.dart';

class TherapyWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const TherapyWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        height: 180.h,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/task_bg.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextStyle.headingStyle
                  .copyWith(color: Colors.white, fontSize: 22.sp),
            ),
            SizedBox(
              width: 200.w,
              child: Text(
                "Lorem Ipsum is a dummy text and a dummy filler to use.",
                style: CustomTextStyle.basicStyle
                    .copyWith(color: Colors.white, fontSize: 12.sp),
              ),
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text(
                  "Total Tasks: 10",
                  style: CustomTextStyle.basicStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
                14.w.horizontalSpace,
                Text(
                  "Completed Tasks: 02",
                  style: CustomTextStyle.basicStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text(
                  "Complete Task",
                  style: CustomTextStyle.basicStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffFE8235),
                  ),
                ),
                12.w.horizontalSpace,
                const Icon(
                  Icons.play_circle_filled_sharp,
                  color: Color(0xffFE8235),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

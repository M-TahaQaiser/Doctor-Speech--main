import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';

class LibraryWidget extends StatelessWidget {
  final String title, percentage, date;
  final Color percColor;
  final double perc;
  const LibraryWidget({
    super.key,
    required this.title,
    required this.percentage,
    required this.date,
    required this.percColor,
    required this.perc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.only(left: 8.w, top: 8.h, bottom: 8.h, right: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: const Color(0xff3232470a).withOpacity(.04),
              blurRadius: 20.r,
              spreadRadius: -2.r,
              offset: const Offset(0, 4)),
          BoxShadow(
              color: const Color(0xff0c1a4b14).withOpacity(.08),
              blurRadius: 20.r,
              spreadRadius: -2.r,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 70.h,
                width: 79.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/lib_1.png"),
                  ),
                ),
              ),
              10.w.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CustomTextStyle.basicStyle.copyWith(
                      color: const Color(0xff39434F),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/calender.svg"),
                      7.w.horizontalSpace,
                      Text(
                        date,
                        style: CustomTextStyle.basicStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                percentage,
                style: CustomTextStyle.basicStyle.copyWith(
                  color: const Color(0xff39434F),
                ),
              ),
              6.h.verticalSpace,
              SizedBox(
                height: 3.h,
                width: 60.w,
                child: ProgressBar(
                  backgroundColor: Colors.grey.withOpacity(.5),
                  value: perc,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      percColor,
                      percColor,
                      percColor,
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

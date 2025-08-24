import 'package:TinyDragonTherapy/model/dummy_text_model.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';
import 'package:TinyDragonTherapy/widgets/library_widget.dart';

class LibraryScreen extends StatelessWidget {
  LibraryScreen({super.key});
  final List<DummyData> data = [
    DummyData(
      title: "Dummy 1",
      mainColor: const Color(0xff734497),
      lightColor: const Color(0xffF2E5FF),
      timeText: "3",
      imageText: "assets/images/lib_3.jpeg",
      levelText: "Beginner",
    ),
    DummyData(
      title: "Dummy 2",
      mainColor: const Color(0xffE68843),
      lightColor: const Color(0xffFFEADB),
      timeText: "5",
      imageText: "assets/images/lib_4.jpeg",
      levelText: "Intermediate",
    ),
    DummyData(
      title: "Dummy 3",
      mainColor: const Color(0xff31AA7A),
      lightColor: const Color(0xffD8F7EA),
      timeText: "5",
      imageText: "assets/images/lib_5.jpeg",
      levelText: "Advanced",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.h),
        child: AppBar(
          elevation: 10,
          shadowColor: Colors.black.withOpacity(0.25),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.keyboard_backspace_outlined,
              color: Colors.grey,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Library',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: kDarkColor,
                  fontWeight: FontWeight.bold,
                ),
            maxLines: 1,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: kDarkColor,
                        ),
                  ),
                  Text(
                    '23',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: kTextColor,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          24.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "For You",
                style: CustomTextStyle.basicStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff39434F)),
              ),
              const Icon(
                Icons.more_horiz,
                color: Colors.blue,
              )
            ],
          ),
          16.h.verticalSpace,
          const LibraryWidget(
            perc: 0.75,
            date: "20.04.23",
            percColor: Color(0xff1B85F3),
            percentage: "75%",
            title: "Speech therapy",
          ),
          16.h.verticalSpace,
          const LibraryWidget(
            perc: 1,
            date: "20.04.23",
            percColor: Color(0xff3DD598),
            percentage: "100%",
            title: "Speech therapy",
          ),
          24.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore More",
                style: CustomTextStyle.basicStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff39434F)),
              ),
              Row(
                children: [
                  Text(
                    "See all",
                    style: CustomTextStyle.basicStyle.copyWith(
                      color: Colors.blue,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                  ),
                ],
              )
            ],
          ),
          16.h.verticalSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                data.length,
                (index) => Container(
                  padding: EdgeInsets.all(8.w),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 100.h,
                            width: 128.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(data[index].imageText),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 28.h,
                            left: 50.w,
                            child: Container(
                              height: 38.h,
                              width: 38.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.r),
                                  color: const Color(0xff2A3240)),
                              child: const Icon(
                                Icons.play_arrow_outlined,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      10.h.verticalSpace,
                      Text(
                        data[index].title,
                        style: CustomTextStyle.basicStyle.copyWith(
                            fontSize: 14.sp, color: const Color(0xff2A3240)),
                      ),
                      6.h.verticalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 3.h,
                          horizontal: 8.w,
                        ),
                        decoration: BoxDecoration(
                          color: data[index].lightColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          data[index].levelText,
                          style: CustomTextStyle.basicStyle.copyWith(
                            color: data[index].mainColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      6.h.verticalSpace,
                      Row(
                        children: [
                          const Icon(
                            Icons.timer_outlined,
                            size: 16,
                            color: Color(0xff606873),
                          ),
                          6.w.horizontalSpace,
                          Text(
                            data[index].timeText,
                            style: CustomTextStyle.basicStyle.copyWith(
                              color: const Color(0xff2A3240),
                              fontSize: 14.sp,
                            ),
                          ),
                          4.w.horizontalSpace,
                          Text(
                            "minutes",
                            style: CustomTextStyle.basicStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ).paddingOnly(right: 16.w, bottom: 20.h),
              ),
            ),
          )
        ],
      ).paddingSymmetric(
        horizontal: 24.w,
      ),
    );
  }
}

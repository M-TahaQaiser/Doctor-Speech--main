import 'package:intl/intl.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  DateTime selectedDate = DateTime.now();
  List<DateTime> dates = [];

  final DateFormat dayFormat = DateFormat('d');
  final DateFormat monthFormat = DateFormat('MMMM');
  final DateFormat weekDayFormat = DateFormat('EEE');
  final DateFormat fullDateFormat = DateFormat('EEEE, d MMMM');
  final _textController = TextEditingController();
  ScrollController scrollController = ScrollController();
  int charCount = 0;

  void _updateCharCount() {
    setState(() {
      charCount = _textController.text.length;
    });
  }

  @override
  void initState() {
    super.initState();

    _textController.addListener(_updateCharCount);
    charCount = _textController.text.length;
    dates = getDatesForSelectedDate(selectedDate);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToSelectedDate();
    });
  }

  String selectedService = '';
  Map<String, bool> services = {
    'Therapy 1': false,
    'Therapy 2': false,
    'Therapy 3': false,
  };

  void _handleCheckboxChange(String service) {
    setState(() {
      // Uncheck all other services
      services.forEach((key, value) {
        if (key != service) {
          services[key] = false;
        }
      });

      // Toggle the selected service
      services[service] = !services[service]!;

      // Update selectedService
      if (services[service]!) {
        selectedService = service;
      } else {
        selectedService = '';
      }
    });
  }

  @override
  void dispose() {
    _textController.removeListener(_updateCharCount);
    _textController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  List<DateTime> getDatesForSelectedDate(DateTime date) {
    return List.generate(30, (index) {
      return date.subtract(Duration(days: 15 - index));
    });
  }

  List<String> times = [
    "09:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:45",
    "13:30",
    "16:15"
  ];

  String? selectedTime;

  void scrollToSelectedDate() {
    if (dates.isNotEmpty) {
      final selectedIndex = dates.indexWhere((date) =>
          date.day == selectedDate.day &&
          date.month == selectedDate.month &&
          date.year == selectedDate.year);

      if (selectedIndex != -1) {
        scrollController.animateTo(
          selectedIndex * 64.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child:
              SvgPicture.asset('assets/images/back-icon.svg', fit: BoxFit.none),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: false,
        title: Text(
          'Sahana V',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: kDarkColor,
                fontWeight: FontWeight.bold,
              ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDivider(
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: 148.h,
                width: Get.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/profile_bg.png"))),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sahana V",
                          style: CustomTextStyle.headingStyle
                              .copyWith(color: Colors.white, fontSize: 20.sp),
                        ),
                        6.h.verticalSpace,
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/location_icon.svg"),
                            6.w.horizontalSpace,
                            Column(
                              children: [
                                Text(
                                  "70 North Street\nLondon, UK",
                                  style: CustomTextStyle.basicStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        5.h.verticalSpace,
                        Row(
                          children: [
                            Text(
                              "4,6",
                              style: CustomTextStyle.basicStyle.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            8.w.horizontalSpace,
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < 4 ? Icons.star : Icons.star_border,
                                  color: Colors.amber,
                                  size: 15.0.r,
                                );
                              }),
                            ),
                          ],
                        )
                      ],
                    ).paddingOnly(left: 10.w, top: 12.h),
                    25.w.horizontalSpace,
                    Image.asset(
                      "assets/images/person-1.png",
                      height: 109.h,
                      width: 109.w,
                    )
                  ],
                ),
              ).paddingSymmetric(horizontal: 24.w),
              20.h.verticalSpace,
              GestureDetector(
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(1980),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != selectedDate) {
                    setState(() {
                      selectedDate = picked;
                      dates = getDatesForSelectedDate(selectedDate);
                    });
                    scrollToSelectedDate();
                  }
                },
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: '${weekDayFormat.format(selectedDate)}, ',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: '${dayFormat.format(selectedDate)} ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: monthFormat.format(selectedDate),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ).paddingOnly(left: 24.w),
                    2.w.horizontalSpace,
                    SvgPicture.asset("assets/images/Arrows.svg")
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 80.h,
                child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  itemBuilder: (context, index) {
                    final date = dates[index];
                    final isSelected = date.day == selectedDate.day &&
                        date.month == selectedDate.month &&
                        date.year == selectedDate.year;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = date;
                        });
                        scrollToSelectedDate();
                      },
                      child: Container(
                        width: 55.w,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color.fromRGBO(209, 230, 255, 1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color:
                                isSelected ? Colors.blue : Colors.grey.shade300,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dayFormat.format(date),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.blue : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              weekDayFormat.format(date),
                              style: TextStyle(
                                fontSize: 14,
                                color: isSelected ? Colors.blue : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              20.h.verticalSpace,
              Text(
                "Availability",
                style: CustomTextStyle.basicStyle
                    .copyWith(color: const Color.fromRGBO(57, 67, 79, 1)),
              ).paddingSymmetric(horizontal: 24.w),
              16.h.verticalSpace,
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // padding: const EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Number of items per row
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    mainAxisExtent: 50.h),
                itemCount: times.length,
                itemBuilder: (context, index) {
                  final time = times[index];
                  bool isSelected = (time == selectedTime);
                  bool isSelectable = !time.startsWith("13:");

                  return GestureDetector(
                    onTap: isSelectable
                        ? () {
                            setState(() {
                              selectedTime = time;
                            });
                          }
                        : null,
                    child: Container(
                      // padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.orange
                            : (isSelectable
                                ? Colors.white
                                : const Color.fromRGBO(217, 223, 230, 1)),
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(
                            color: isSelected
                                ? Colors.orange
                                : const Color.fromRGBO(128, 139, 154, 1)),
                      ),
                      child: Center(
                        child: Text(time,
                            style: CustomTextStyle.basicStyle.copyWith(
                              color: isSelected
                                  ? Colors.white
                                  : const Color.fromRGBO(128, 139, 154, 1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
                  );
                },
              ).paddingSymmetric(horizontal: 24.w),
              20.h.verticalSpace,
              const CustomDivider(
                color: Colors.grey,
              ),
              20.h.verticalSpace,
              Text(
                "Services",
                style: CustomTextStyle.basicStyle
                    .copyWith(color: const Color.fromRGBO(57, 67, 79, 1)),
              ).paddingSymmetric(horizontal: 24.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var service in services.keys)
                    GestureDetector(
                      onTap: () {
                        _handleCheckboxChange(service);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.sp, vertical: 8.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color:
                                    const Color(0xff3232470a).withOpacity(.04),
                                blurRadius: 20.r,
                                spreadRadius: -2.r,
                                offset: const Offset(0, 4)),
                            BoxShadow(
                                color:
                                    const Color(0xff0c1a4b14).withOpacity(.08),
                                blurRadius: 20.r,
                                spreadRadius: -2.r,
                                offset: const Offset(0, 4)),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Checkbox(
                                  // fillColor: WidgetStateProperty.resolveWith(
                                  //   (states) => Colors.blue,
                                  // ),
                                  activeColor: Colors.blue,
                                  checkColor: Colors.white,
                                  focusColor: Colors.blue,
                                  value: services[service],
                                  onChanged: (value) {
                                    _handleCheckboxChange(service);
                                  },
                                ),
                                Text(
                                  service,
                                  style: CustomTextStyle.basicStyle,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$",
                                  style: CustomTextStyle.basicStyle.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                Text(
                                  service == "Therapy 1" ? "30" : "20",
                                  style: CustomTextStyle.basicStyle.copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                      ).paddingOnly(bottom: 16.h),
                    ),
                  24.h.verticalSpace,
                  Text(
                    "Prices are estimative and the payment will be\nmade at the location",
                    style: CustomTextStyle.basicStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: null,
                    ),
                  ),
                  24.h.verticalSpace,
                  const CustomDivider(color: Colors.grey),
                  24.h.verticalSpace,
                  Text(
                    "Add Note",
                    style: CustomTextStyle.basicStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: null,
                    ),
                  ),
                  10.h.verticalSpace,
                  CustomTextField(
                    controller: _textController,
                    hint: "Suggested",
                    maxLines: 4,
                    minLines: 3,
                    suffixIcon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        '$charCount/250',
                        style:
                            const TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ).paddingOnly(top: 50.h),
                  ),
                  50.h.verticalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: const Color(0xffFE8235),
                    ),
                    child: Center(
                      child: Text(
                        "Confirm booking",
                        style: CustomTextStyle.basicStyle.copyWith(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              ).paddingSymmetric(horizontal: 24.w)
            ],
          ),
        ),
      ),
    );
  }
}

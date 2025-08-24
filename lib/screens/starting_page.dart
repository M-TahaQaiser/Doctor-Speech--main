import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:TinyDragonTherapy/controller/auth_controller.dart';
import 'package:TinyDragonTherapy/screens/tabs_screen.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';
import 'package:TinyDragonTherapy/widgets/custom_button.dart';

class StartingPage extends StatelessWidget {
  StartingPage({super.key});
  final authController = Get.put(AuthController());
  final PageController pageController = PageController();
  final List<String> pages = [
    "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. ",
    "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. ",
    "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. "
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Enable resizing to avoid bottom inset (keyboard)
      backgroundColor: AppColors.authbgColor,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/auth.png"),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFAFAFA),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(26.r),
                    topRight: Radius.circular(26.r),
                  ),
                ),
                height: .565.sh,
                width: Get.width,
                padding: EdgeInsets.only(
                  bottom: 11.h,
                  top: 56.h,
                  right: 24.w,
                  left: 24.w,
                ),
                child: Column(
                  children: [
                    // 20.h.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: pages.length,
                        effect: CustomizableEffect(
                          activeDotDecoration: DotDecoration(
                            width: 56.w,
                            height: 8.h,
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          dotDecoration: DotDecoration(
                            width: 56.w,
                            height: 4.h,
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          spacing: 16.r,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 190.h,
                        width: Get.width,
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: pages.length,
                          controller: pageController,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text(
                                  "Lorem Ipsum Text",
                                  style: CustomTextStyle.headingStyle,
                                ),
                                Text(
                                  pages[index],
                                  style: CustomTextStyle.basicStyle
                                      .copyWith(fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ).paddingSymmetric(horizontal: 10.w),
                              ],
                            );
                          },
                        )),
                    35.h.verticalSpace,
                    PrimaryButton(
                      title: "Next",
                      onTap: () {
                        Get.to(() => const TabsScreen());
                      },
                    ),
                    16.h.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        Get.close(1);
                      },
                      child: SizedBox(
                        height: 54.h,
                        child: Text(
                          "Go Back",
                          style: CustomTextStyle.basicStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 315.h,
              left: Get.width / 2.5,
              child: Container(
                padding: EdgeInsets.all(8.r),
                height: 80.h,
                width: 80.w,
                decoration: const BoxDecoration(
                  color: Color(0xffFAFAFA),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset("assets/images/edit_icon.svg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

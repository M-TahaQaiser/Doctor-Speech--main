import 'package:flutter/foundation.dart';
import 'package:TinyDragonTherapy/controller/auth_controller.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';
import 'package:TinyDragonTherapy/widgets/custom_button.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class ValidationScreen extends StatelessWidget {
  ValidationScreen({super.key});
  final authController = Get.put(AuthController());
  final OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Enable resizing to avoid bottom inset (keyboard)
      backgroundColor: AppColors.authbgColor,
      body: SingleChildScrollView(
        child: SizedBox(
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
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                    ),
                  ),
                  height: .63.sh,
                  width: Get.width,
                  padding: EdgeInsets.only(
                    bottom: 11.h,
                    top: 56.h,
                    right: 24.w,
                    left: 24.w,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("Validation code ",
                            style: CustomTextStyle.headingStyle),
                        10.h.verticalSpace,
                        const Text(
                          "Check your email inbox and enter the\nvalidation code here",
                          style: TextStyle(
                            color: Color(0xff8F8F8F),
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        24.h.verticalSpace,
                        //!
                        OTPTextField(
                            controller: otpController,
                            // otpController: otpController,
                            // fieldStyle: FieldStyle.underline,
                            // borderRadius: BorderRadius.circular(15),
                            // width: 300.w,
                            // height: 60.h,
                            // fieldWidth: 50.w,
                            length: 5,
                            otpFieldStyle: OtpFieldStyle(
                                borderColor: Colors.grey,
                                focusBorderColor: Colors.grey,
                                enabledBorderColor: Colors.grey,
                                disabledBorderColor: Colors.grey),
                            width: MediaQuery.of(context).size.width,
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldWidth: 45.w,
                            fieldStyle: FieldStyle.box,
                            outlineBorderRadius: 15.r,
                            style:
                                TextStyle(fontSize: 17.sp, color: Colors.black),
                            onChanged: (pin) {
                              print("Changed: $pin");
                            },
                            onCompleted: (pin) {
                              if (kDebugMode) {
                                print("Completed: $pin");
                              }
                            }),

                        38.h.verticalSpace,
                        PrimaryButton(
                          onTap: () {
                            Get.close(2);
                          },
                          title: "Confirm",
                        ),
                        8.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Did not receive the code? ",
                              style: CustomTextStyle.basicStyle
                                  .copyWith(fontSize: 14.sp),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Resend",
                                style: CustomTextStyle.basicStyle.copyWith(
                                    color: kPrimaryColor, fontSize: 14.sp),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 220.h,
                left: Get.width / 2.5,
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  height: 80.h,
                  width: 80.w,
                  decoration: const BoxDecoration(
                    color: Color(0xffFAFAFA),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    "assets/images/validation_icon.svg",
                    // height: 50.h,
                    // width: 60.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

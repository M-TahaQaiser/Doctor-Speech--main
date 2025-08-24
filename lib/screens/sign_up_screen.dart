import 'package:TinyDragonTherapy/controller/auth_controller.dart';
import 'package:TinyDragonTherapy/screens/validation_screen.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';
import 'package:TinyDragonTherapy/widgets/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final authController = Get.put(AuthController());
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
                  height: .65.sh,
                  width: Get.width,
                  padding: EdgeInsets.only(
                    bottom: 11.h,
                    top: 56.h,
                    right: 24.w,
                    left: 24.w,
                  ),
                  child: Column(
                    children: [
                      Text("Create Account",
                          style: CustomTextStyle.headingStyle),
                      10.h.verticalSpace,
                      const Text(
                        "Welcome! Please enter your information\nbelow to sign in to the app.",
                        style: TextStyle(
                          color: Color(0xff8F8F8F),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      24.h.verticalSpace,
                      const CustomTextField(
                        hint: 'Your email',
                        // controller: ,
                      ),
                      // 16.h.verticalSpace,
                      GetBuilder<AuthController>(
                        builder: (controller) {
                          return Row(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    side: const BorderSide(color: Colors.grey),
                                    value: controller.isTherapist,
                                    onChanged: (value) {
                                      controller.updateSelection('Therapist');
                                    },
                                  ),
                                  Text(
                                    "Therapist",
                                    style: CustomTextStyle.basicStyle
                                        .copyWith(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 40),
                              Row(
                                children: [
                                  Checkbox(
                                    side: const BorderSide(color: Colors.grey),
                                    value: controller.isClient,
                                    onChanged: (value) {
                                      controller.updateSelection('Client');
                                    },
                                  ),
                                  Text(
                                    "Client",
                                    style: CustomTextStyle.basicStyle
                                        .copyWith(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                      // 16.h.verticalSpace,
                      const CustomTextField(
                        hint: 'Password',
                        ispass: true,
                        suffixIcon: Icon(Icons.visibility),
                      ),
                      GetBuilder(
                        init: authController,
                        builder: (controller) {
                          return Row(
                            children: [
                              Checkbox(
                                side: const BorderSide(color: Colors.grey),
                                value: controller.rememberMe,
                                onChanged: (value) {
                                  controller.updateRememberMe(value!);
                                },
                              ),
                              // 8.w.horizontalSpace,
                              Text(
                                "Accept Terms and Conditions",
                                style: CustomTextStyle.basicStyle
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ],
                          );
                        },
                      ),
                      27.h.verticalSpace,
                      PrimaryButton(
                        onTap: () {
                          Get.to(() => ValidationScreen());
                        },
                        title: "Register",
                      ),
                      8.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: CustomTextStyle.basicStyle
                                .copyWith(fontSize: 14.sp),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.close(1);
                            },
                            child: Text(
                              "SignIn!",
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
              Positioned(
                top: 250.h,
                left: Get.width / 2.5,
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: const BoxDecoration(
                    color: Color(0xffFAFAFA),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset("assets/images/signin_logo.svg"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

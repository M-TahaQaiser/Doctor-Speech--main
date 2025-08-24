import 'dart:io';

import 'package:TinyDragonTherapy/controller/auth_controller.dart';
import 'package:TinyDragonTherapy/screens/sign_up_screen.dart';
import 'package:TinyDragonTherapy/screens/starting_page.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';
import 'package:TinyDragonTherapy/widgets/custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final authController = Get.put(AuthController());

  final emailcontroller = TextEditingController();

  final passcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitConfirmationDialog(BuildContext context) async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                "Exit Confirmation",
                style: CustomTextStyle.headingStyle.copyWith(fontSize: 20.h),
              ),
              content: Text(
                "Do you really want to Exit?",
                style: CustomTextStyle.basicStyle,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    "No",
                    style: CustomTextStyle.basicStyle
                        .copyWith(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    "Yes",
                    style: CustomTextStyle.basicStyle
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ) ??
          false; // If the dialog is dismissed by tapping outside, return false
    }

    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Enable resizing to avoid bottom inset (keyboard)
      backgroundColor: AppColors.authbgColor,
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          // Show a confirmation dialog
          bool shouldLeave = await showExitConfirmationDialog(context);
          if (shouldLeave) {
            exit(0);
          }
        },
        child: SingleChildScrollView(
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
                        topLeft: Radius.circular(27.r),
                        topRight: Radius.circular(27.r),
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
                        Text("Sign In", style: CustomTextStyle.headingStyle),
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
                        CustomTextField(
                          hint: 'Your email',
                          controller: emailcontroller,
                        ),
                        16.h.verticalSpace,
                        CustomTextField(
                          controller: passcontroller,
                          ispass: true,
                          hint: 'Password',
                          suffixIcon: Icon(Icons.visibility),
                          // controller: ,
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
                        38.h.verticalSpace,
                        PrimaryButton(
                          onTap: () {
                            Get.to(() => StartingPage());
                          },
                          title: "Sign In",
                        ),
                        8.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account? ",
                              style: CustomTextStyle.basicStyle
                                  .copyWith(fontSize: 14.sp),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => SignUpScreen());
                              },
                              child: Text(
                                "Create Account!",
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
      ),
    );
  }
}

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  bool rememberMe = false;

  void updateRememberMe(bool value) {
    rememberMe = value;
    update();
  }

  bool isTherapist = false;
  bool isClient = false;

  void updateSelection(String role) {
    if (role == 'Therapist') {
      isTherapist = true;
      isClient = false;
    } else if (role == 'Client') {
      isTherapist = false;
      isClient = true;
    }
    update();
  }
}

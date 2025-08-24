import 'package:TinyDragonTherapy/util/export_all.dart';

class NavigatorController extends GetxController {
  int currentIndex = 0;

  void updateIndex(int index) {
    currentIndex = index;
    update();
  }

  void resetIndex() {
    currentIndex = 0;
    update();
  }
}

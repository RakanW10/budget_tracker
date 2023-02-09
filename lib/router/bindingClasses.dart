import 'package:budget_tracker/controllers/homepageController.dart';
import 'package:budget_tracker/controllers/takeInfoController.dart';
import 'package:get/get.dart';

class HomepageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomepageController());
  }
}

class TakeInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TakeInfoController());
  }
}

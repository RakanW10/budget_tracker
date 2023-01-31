import 'dart:convert';

import 'package:budget_tracker/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomepageController extends GetxController {
  late User user;
  @override
  void onInit() async {
    //! number 1 should replaced with uid of the user
    var userData =
        await FirebaseFirestore.instance.collection("users").doc("1").get();
    user = await User.fromJson(json: userData.data()!);
    print(user.toString());
  }
}

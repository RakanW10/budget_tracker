import 'package:budget_tracker/Constants.dart';
import 'package:budget_tracker/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  User? user;
  RxBool isHomepageLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    var userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(storage.read("uid"))
        .get();
    user = User.fromJson(json: userData.data()!);
    isHomepageLoading = false.obs;
    update();
  }

  double monthly_obligations_rate() {
    return user!.total_obligations_amount / user!.income * 100;
  }

  double monthly_exchange_rate() {
    double total_monthly_exchange = 0;
    for (var element in user!.elements) {
      total_monthly_exchange += element.elementPrice;
    }
    var numberOfDaysInMonth =
        DateUtils.getDaysInMonth(DateTime.now().year, DateTime.now().month);
    return total_monthly_exchange / numberOfDaysInMonth;
  }

  double total_monthly_exchange() {
    double total_monthly_exchange = 0;

    for (var element in user!.elements) {
      if ((DateTime.now().year == element.elementDate.year) &&
          (DateTime.now().month == element.elementDate.month)) {
        total_monthly_exchange += element.elementPrice;
      }
    }

    return total_monthly_exchange;
  }
}

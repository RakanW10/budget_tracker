import 'package:budget_tracker/Constants.dart';
import 'package:budget_tracker/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budget_tracker/models/elementModel.dart' as e;

class HomepageController extends GetxController {
  OurUser? user;
  RxBool isHomepageLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    var userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(storage.read("uid"))
        .get();
    user = OurUser.fromJson(json: userData.data()!);
    user!.elements.sort((a, b) {
      return b.elementDate.compareTo(a.elementDate);
    });
    isHomepageLoading = false.obs;
    update();
  }

  double monthly_obligations_rate() {
    if (user!.income == 0) return 0;
    return user!.total_obligations_amount / user!.income * 100;
  }

  double monthly_exchange_rate() {
    double total_monthly_exchange = 0;
    for (var element in user!.elements) {
      if ((DateTime.now().year == element.elementDate.year) &&
          (DateTime.now().month == element.elementDate.month) &&
          (element.elementPrice < 0)) {
        total_monthly_exchange += element.elementPrice.abs();
      }
    }
    var numberOfDaysInMonth =
        DateUtils.getDaysInMonth(DateTime.now().year, DateTime.now().month);
    return total_monthly_exchange / numberOfDaysInMonth;
  }

  double total_monthly_exchange() {
    double total_monthly_exchange = 0;

    for (var element in user!.elements) {
      if ((DateTime.now().year == element.elementDate.year) &&
          (DateTime.now().month == element.elementDate.month) &&
          (element.elementPrice < 0)) {
        total_monthly_exchange += element.elementPrice.abs();
      }
    }
    return total_monthly_exchange;
  }

  void addElement({required e.Element element}) {
    user!.elements.add(element);
    user!.elements.sort((a, b) {
      return b.elementDate.compareTo(a.elementDate);
    });
    update();
  }
}

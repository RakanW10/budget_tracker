import 'package:budget_tracker/style.dart';
import 'package:budget_tracker/view/components/operatoinCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

//! fake operations data
var data = [
  {
    "iconPath": "assets/icons/fast-food.svg",
    "title": "طعام",
    "date": "28 May 2020",
    "amount": -25.50,
    "paymentMethod": "نقدًا"
  },
  {
    "iconPath": "assets/icons/bike.svg",
    "title": "Uber",
    "date": "26 May 2020",
    "amount": -40.13,
    "paymentMethod": "apply pay"
  },
  {
    "iconPath": "assets/icons/hand-money-dollar-coin-icon.svg",
    "title": "الراتب",
    "date": "1 May 2020",
    "amount": 15000.00,
    "paymentMethod": "بنك"
  },
  {
    "iconPath": "assets/icons/shopping-bags.svg",
    "title": "Nike",
    "date": "26 Feb 2020",
    "amount": -850.00,
    "paymentMethod": "apply pay"
  },
];

class OperatinoList extends StatelessWidget {
  const OperatinoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.48,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: ((context, index) => OperationCard(
              iconPath: data[index]["iconPath"].toString(),
              title: data[index]["title"].toString(),
              data: data[index]["date"].toString(),
              amount: data[index]["amount"] as double,
              paymentMethod: data[index]["paymentMethod"].toString(),
            )),
      ),
    );
  }
}
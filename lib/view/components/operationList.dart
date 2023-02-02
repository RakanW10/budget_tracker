import 'package:budget_tracker/view/components/operatoinCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budget_tracker/models/elementModel.dart' as e;

var icons = {
  "Food": "assets/icons/fast-food.svg",
  "Shopping": "assets/icons/shopping-bags.svg",
  "Transport": "assets/icons/bike.svg",
  "Income": "assets/icons/hand-money-dollar-coin-icon.svg",
};

class OperatinoList extends StatelessWidget {
  const OperatinoList({super.key, required this.operations});
  final List<e.Element> operations;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.40,
      child: ListView.builder(
        itemCount: operations.length,
        itemBuilder: ((context, index) => OperationCard(
              iconPath: icons[operations[index].elementType]!,
              title: operations[index].elementName,
              date: operations[index].elementDate,
              amount: operations[index].elementPrice,
              paymentMethod: operations[index].elementPayType,
            )),
      ),
    );
  }
}

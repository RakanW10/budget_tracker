import 'package:budget_tracker/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OperationCard extends StatelessWidget {
  const OperationCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.date,
    required this.amount,
    required this.paymentMethod,
  });
  final String iconPath;
  final String title;
  final DateTime date;
  final num amount;
  final String paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 35),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: secondray_background,
            ),
            child: SvgPicture.asset(iconPath),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: text_main,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${date.year}-${date.month}-${date.day}",
                  style: TextStyle(
                    fontSize: 14,
                    color: text_secondray,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${amount.abs().toString()} ريال",
                  style: TextStyle(
                    fontSize: 18,
                    color: text_main,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  paymentMethod,
                  style: TextStyle(
                    fontSize: 18,
                    color: text_secondray,
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            amount < 0
                ? "assets/icons/arrow-thin-bottom-left-corner-icon 1.svg"
                : "assets/icons/arrow-thin-top-left-corner-icon 1.svg",
            height: 25,
            width: 25,
          ),
        ],
      ),
    );
  }
}

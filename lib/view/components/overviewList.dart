import 'package:budget_tracker/view/components/overviewCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OverviewList extends StatelessWidget {
  const OverviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          OverviewCard(
            icon: SvgPicture.asset("assets/icons/Wallet.svg"),
            mainText: "مجموع الصرف الشهرية",
            amount: "1400.00",
            SAR: true,
            onTap: () {
              //TODO: need a function
            },
          ),
          const SizedBox(
            width: 18,
          ),
          OverviewCard(
            icon: SvgPicture.asset("assets/icons/Wallet.svg"),
            mainText: "معدل الصرف الشهري",
            amount: "1400.00",
            onTap: () {
              //TODO: need a function
            },
          ),
          const SizedBox(
            width: 18,
          ),
          OverviewCard(
            icon: SvgPicture.asset("assets/icons/Wallet.svg"),
            mainText: "معدل الالتزامات الشهرية",
            amount: "1400.00",
            onTap: () {
              //TODO: need a function
            },
          ),
        ],
      ),
    );
  }
}

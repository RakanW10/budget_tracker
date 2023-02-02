import 'package:budget_tracker/view/components/overviewCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OverviewList extends StatelessWidget {
  const OverviewList({
    super.key,
    required this.total_exchange_rate,
    required this.monthly_exchange_rate,
    required this.monthly_obligations_rate,
  });
  final double total_exchange_rate;
  final double monthly_exchange_rate;

  final double monthly_obligations_rate;

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
            amount: total_exchange_rate.toStringAsFixed(2),
            SAR: true,
          ),
          const SizedBox(
            width: 18,
          ),
          OverviewCard(
            icon: SvgPicture.asset("assets/icons/Wallet.svg"),
            mainText: "معدل الصرف الشهري",
            amount: monthly_exchange_rate.toStringAsFixed(2),
            SAR: true,
          ),
          const SizedBox(
            width: 18,
          ),
          OverviewCard(
            icon: SvgPicture.asset("assets/icons/Wallet.svg"),
            mainText: "معدل الالتزامات الشهرية",
            amount: monthly_obligations_rate.toStringAsFixed(2),
          ),
        ],
      ),
    );
  }
}

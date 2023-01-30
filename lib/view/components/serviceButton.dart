import 'package:budget_tracker/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceButton extends StatelessWidget {
  const ServiceButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTab,
  });
  final SvgPicture icon;
  final String label;
  final Function() onTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132,
      height: 108,
      decoration: BoxDecoration(
        color: cards_background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 38,
            width: 38,
            margin: const EdgeInsets.only(bottom: 2),
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: icon,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              color: text_main,
            ),
          ),
        ],
      ),
    );
  }
}

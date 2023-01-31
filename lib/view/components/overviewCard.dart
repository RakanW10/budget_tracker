import 'package:budget_tracker/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({
    super.key,
    required this.icon,
    required this.mainText,
    required this.amount,
    required this.onTap,
    this.SAR = false,
  });
  final SvgPicture icon;
  final String mainText;
  final String amount;
  final Function() onTap;
  final bool SAR;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        // borderRadius: BorderRadius.circular(8),
        // highlightColor: const Color(0xFF7FC3DC),
        // splashColor: const Color(0xFF7FC3DC),
        onTap: onTap,
        child: Container(
          height: 200,
          width: 124,
          padding: const EdgeInsets.only(left: 6, right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: secondray_background,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 26),
                child: const SizedBox(
                  height: 26,
                ),
              ),
              icon,
              Text(
                mainText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: text_main,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: text_secondray,
                ),
              ),
              Text(
                SAR ? "ريال" : "%",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: text_secondray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

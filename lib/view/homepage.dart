import 'package:budget_tracker/Constants.dart';
import 'package:budget_tracker/style.dart';
import 'package:budget_tracker/view/components/overviewCard.dart';
import 'package:budget_tracker/view/components/overviewList.dart';
import 'package:budget_tracker/view/mainCanva.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double WIDTH = Get.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            CustomPaint(
              size: Size(WIDTH, (WIDTH * 0.2365038560411311).toDouble()),
              painter: MainCanava(),
            ),
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/Menu.svg"),
                      InkWell(
                        onTap: () {
                          //TODO Enter the Profile
                        },
                        child: storage.read("personal-image") != null
                            ? Image.network(storage.read("personal-image"))
                            : Image.asset("assets/images/defualtImage.png"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                Container(
                  margin: EdgeInsets.only(right: 29),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "نظرة عامة",
                        style: TextStyle(
                          color: text_main,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      OverviewList(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

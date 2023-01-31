import 'package:budget_tracker/constants.dart';
import 'package:budget_tracker/style.dart';
import 'package:budget_tracker/view/components/operationList.dart';
import 'package:budget_tracker/view/components/overviewList.dart';
import 'package:budget_tracker/view/paints/homepageBackground.dart';
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
      body: Stack(
        children: [
          CustomPaint(
            size: Size(WIDTH, (WIDTH * 1.0692307692307692).toDouble()),
            painter: homepageBackgrund(),
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
                    const OverviewList(),
                    const SizedBox(
                      height: 42,
                    ),
                    // const ServiceList(),
                    // ConstrainedBox(
                    //   constraints: BoxConstraints(maxHeight: 42),
                    //   child: const SizedBox(
                    //     height: 42,
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "آخر العمليات",
                          style: TextStyle(
                            color: text_main,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 28),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: secondray_background,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 10),
                          child: SvgPicture.asset("assets/icons/dots.svg"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const OperatinoList(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

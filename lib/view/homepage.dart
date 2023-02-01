import 'package:budget_tracker/constants.dart';
import 'package:budget_tracker/controllers/homepageController.dart';
import 'package:budget_tracker/router/router.dart';
import 'package:budget_tracker/style.dart';
import 'package:budget_tracker/view/components/operationList.dart';
import 'package:budget_tracker/view/components/overviewList.dart';
import 'package:budget_tracker/view/loadingScreen.dart';
import 'package:budget_tracker/view/paints/homepageBackground.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final HomepageController _homepageController = Get.find();
  @override
  Widget build(BuildContext context) {
    double WIDTH = Get.width;
    return GetBuilder<HomepageController>(
      builder: (controller) => _homepageController.isHomepageLoading == true
          ? const LoadingScreen()
          : Scaffold(
              backgroundColor: backgroundColor,
              floatingActionButton: FloatingActionButton(
                backgroundColor: secondray_background,
                onPressed: () {
                  Get.toNamed(RouterName.addElementPage);
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
              body: Stack(
                children: [
                  CustomPaint(
                    size: Size(WIDTH, (WIDTH * 1.0692307692307692).toDouble()),
                    painter: homepageBackgrund(),
                  ),
                  SafeArea(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset("assets/icons/Menu.svg"),
                              InkWell(
                                onTap: () {
                                  //TODO Enter the Profile
                                },
                                child: storage.read("personal-image") != null
                                    ? Image.network(
                                        storage.read("personal-image"))
                                    : Image.asset(
                                        "assets/images/defualtImage.png"),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 29),
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
                              OverviewList(
                                monthly_obligations_rate: _homepageController
                                    .monthly_obligations_rate(),
                                monthly_exchange_rate:
                                    _homepageController.monthly_exchange_rate(),
                                total_exchange_rate: _homepageController
                                    .total_monthly_exchange(),
                              ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    child: SvgPicture.asset(
                                        "assets/icons/dots.svg"),
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
                  ),
                ],
              ),
            ),
    );
  }
}

import 'package:budget_tracker/style.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../router/router.dart';
import '../auth/login.dart';

Widget SplashElement({
  required BuildContext context,
  required String title,
  required String description,
  required CarouselController controller,
  required String imagePath,
  required bool isLast,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        imagePath,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.075,
      ),
      Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
      ),
      isLast
          ? SizedBox(
              height: 66,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    elevatedButtonColor,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {
                  Get.offAllNamed(RouterName.login);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "البدء         ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            )
          : TextButton(
              onPressed: () {
                controller.nextPage();
              },
              child: Text(
                "التالي",
                style: TextStyle(
                  color: appGrayColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
    ],
  );
}

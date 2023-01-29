import 'package:budget_tracker/style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'widgets/SliderElement.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CarouselSlider(
        carouselController: buttonCarouselController,
        items: [
          SplashElement(
            context: context,
            title: "قم بتدوين المصروفات",
            description: "قم بتدوين نفقاتك اليومية للمساعدة في إدارة الأموال",
            imagePath: 'assets/images/p1.png',
            isLast: false,
            controller: buttonCarouselController,
          ),
          SplashElement(
            context: context,
            title: "إدارة بسيطة للأموال",
            description:
                "احصل على إشعاراتك أو تنبيهاتك عندما تفعل النفقات الزائدة",
            imagePath: 'assets/images/p2.png',
            isLast: false,
            controller: buttonCarouselController,
          ),
          SplashElement(
            context: context,
            title: "سهل التتبع والتحليل",
            description:
                "يساعد تتبع نفقاتك على التأكد من أنك لا تفرط في الإنفاق",
            imagePath: 'assets/images/p3.png',
            isLast: true,
            controller: buttonCarouselController,
          ),
        ],
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1,
            // animateToClosest: false,
            enableInfiniteScroll: false),
      ),
    );
  }
}

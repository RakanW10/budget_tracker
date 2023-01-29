import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import 'serviceButton.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ServiceButton(
            icon: SvgPicture.asset(
              "assets/icons/Plus.svg",
              color: Colors.black,
            ),
            label: "الادخار",
            onTab: () {
              //TODO: add you funtion here
            },
          ),
          const SizedBox(
            width: 18,
          ),
          ServiceButton(
            icon: SvgPicture.asset(
              "assets/icons/Notification.svg",
            ),
            label: "ذكرني",
            onTab: () {
              //TODO: add you funtion here
            },
          ),
          const SizedBox(
            width: 18,
          ),
          ServiceButton(
            icon: SvgPicture.asset(
              "assets/icons/Notification.svg",
            ),
            label: "ذكرني",
            onTab: () {
              //TODO: add you funtion here
            },
          ),
        ],
      ),
    );
  }
}

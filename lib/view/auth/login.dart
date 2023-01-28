import 'package:budget_tracker/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path_drawing/path_drawing.dart';

import '../customPain.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var WIDTH = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          children: [
            CustomPaint(
              size: Size(
                  WIDTH,
                  (WIDTH * 0.2365038560411311)
                      .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
            ),
            Container(
                padding: const EdgeInsets.only(top: 22),
                child: const Text(
                  "هَلَّلَ",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
          ],
        ));
  }
}

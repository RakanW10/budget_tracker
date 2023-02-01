import 'package:budget_tracker/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: const Center(
        child: SpinKitCircle(
          size: 140,
          color: Colors.white,
        ),
      ),
    );
  }
}

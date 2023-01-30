import 'package:flutter/material.dart';

import '../style.dart';

class AddElementPage extends StatelessWidget {
  const AddElementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

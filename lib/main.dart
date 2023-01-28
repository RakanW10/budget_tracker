import 'package:budget_tracker/router/router.dart';
import 'package:budget_tracker/view/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      // initialRoute: RouterName.Login,
      // getPages: routerApp,
      home: Login(),
    );
  }
}

import 'package:budget_tracker/router/bindingClasses.dart';
import 'package:budget_tracker/view/addElementPage.dart';
import 'package:budget_tracker/view/auth/signup.dart';
import 'package:budget_tracker/view/homepage.dart';
import 'package:get/get.dart';

import '../view/splashScreen.dart';
import '../view/auth/login.dart';

List<GetPage<dynamic>> routerApp = [
  GetPage(
    name: RouterName.homepage,
    page: () =>  Homepage(),
    binding: HomepageBinding(),
  ),
  GetPage(
    name: RouterName.login,
    page: () => Login(),
  ),
  GetPage(
    name: RouterName.register,
    page: () => Signup(),
  ),
  GetPage(
    name: RouterName.splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: RouterName.addElementPage,
    page: () => AddElementPage(),
  )
];

abstract class RouterName {
  static const String homepage = "/homepage";
  static const String login = "/login";
  static const String register = "/register";
  static const String splashScreen = "/splashscreen";
  static const String addElementPage = "/addelementpage";
}

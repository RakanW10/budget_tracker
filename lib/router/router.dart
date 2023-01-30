import 'package:budget_tracker/router/bindingClasses.dart';
import 'package:budget_tracker/view/addElementPage.dart';
import 'package:budget_tracker/view/auth/signup.dart';
import 'package:budget_tracker/view/homepage.dart';
import 'package:get/get.dart';

import '../view/SplashScreen.dart';
import '../view/auth/login.dart';

List<GetPage<dynamic>> routerApp = [
  GetPage(
    name: RouterName.homepage,
    page: () => const Homepage(),
    binding: HomepageBinding(),
  ),
  GetPage(
    name: RouterName.Login,
    page: () => Login(),
  ),
  GetPage(
    name: RouterName.Register,
    page: () => Signup(),
  ),
  GetPage(
    name: RouterName.SplashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: RouterName.AddElementPage,
    page: () => const AddElementPage(),
  )
];

abstract class RouterName {
  static const String homepage = "/homepage";
  static const String Login = "/login";
  static const String Register = "/register";
  static const String SplashScreen = "/splashscreen";
  static const String AddElementPage = "/addelementpage";
}

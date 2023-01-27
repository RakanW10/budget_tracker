import 'package:budget_tracker/router/bindingClasses.dart';
import 'package:budget_tracker/view/homepage.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routerApp = [
  GetPage(
    name: RouterName.homepage,
    page: () => const Homepage(),
    binding: HomepageBinding(),
  ),
];

abstract class RouterName {
  static const String homepage = "/homepage";
}

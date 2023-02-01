import 'package:budget_tracker/controllers/homepageController.dart';
import 'package:budget_tracker/router/router.dart';
import 'package:budget_tracker/view/splashScreen.dart';
import 'package:budget_tracker/view/auth/login.dart';
import 'package:budget_tracker/view/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';
import 'view/auth/signup.dart';

var storageData = GetStorage();

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // !jsut for test
    HomepageController c = Get.put(HomepageController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: const Locale('ar'),
      title: 'Material App',
      initialRoute: RouterName.homepage,
      // initialRoute: RouterName.addElementPage,
      getPages: routerApp,
    );
  }
}

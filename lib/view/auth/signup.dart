import 'package:budget_tracker/controllers/validator.dart';
import 'package:budget_tracker/router/router.dart';
import 'package:budget_tracker/services/firebaseAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style.dart';
import '../paints/mainCanva.dart';
import '../widgets/customInputFiled.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userPassword1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var WIDTH = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            CustomPaint(
              size: Size(WIDTH, (WIDTH * 0.2365038560411311).toDouble()),
              painter: MainCanava(),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
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
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  CustomInputFiled(
                    userController: userEmail,
                    labelName: "البريد الأكتروني",
                    hintText: "ادخل البريد الأكتروني",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "can not be empty";
                      } else if (val.isValidPassword()) {
                        return "not valid passowrd";
                      }
                      return null;
                    },
                    inputType: InputType.email,
                  ),
                  CustomInputFiled(
                    userController: userPassword,
                    labelName: "كلمة المرور",
                    hintText: "ادخل كلمة المرور",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "enter your password";
                      } else if (val.isValidPassword()) {
                        return "not valid password";
                      }
                      return null;
                    },
                    inputType: InputType.password,
                  ),
                  CustomInputFiled(
                    userController: userPassword1,
                    labelName: "كرر كلمة المرور",
                    hintText: "كرر كلمة المرور",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "enter your password";
                      } else if (val.isValidPassword()) {
                        return "not valid password";
                      }
                      return null;
                    },
                    inputType: InputType.password,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 44, left: 32, right: 32),
                    child: SizedBox(
                      height: 66,
                      child: ElevatedButton(
                        onPressed: () {
                          
                          normalSignUp(
                            email: userEmail.text,
                            password: userPassword.text,
                          );
                          // Get.toNamed(RouterName.<-Page Name->);
                          //! need to go to the page that take has informations
                          //! like, total income and total obligations
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            elevatedButtonColor,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('التسجيل         '),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 32),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "نسيت كلمة المرور؟",
                      style: TextStyle(color: appGrayColor),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.055,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "لديك حساب؟",
                      style: TextStyle(color: appGrayColor),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(RouterName.login);
                      },
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(color: elevatedButtonColor),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      "أو",
                      style: TextStyle(color: appGrayColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16, left: 32, right: 32, bottom: 16),
                    child: SizedBox(
                      height: 66,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/icons8-google-48.png',
                              width: 36,
                              height: 36,
                            ),
                            const Text(
                              'تسجيل الدخول بحساب جوجل',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

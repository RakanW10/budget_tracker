import 'package:budget_tracker/style.dart';
import 'package:flutter/material.dart';
import '../customPain.dart';

class Login extends StatelessWidget {
  Login({super.key});
  bool isSecret = true;
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
              painter: RPSCustomPainter(),
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 32, right: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: const Text(
                            "البريد الأكتروني",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "ادخل البريد الأكتروني",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            fillColor: textFormFileColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 32, right: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: const Text(
                            "كلمة المرور",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 12.0),
                              child: GestureDetector(
                                child: isSecret
                                    ? const Icon(
                                        Icons.visibility,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                      ),
                                onTap: () => !isSecret,
                              ),
                            ),
                            suffixIconColor: Colors.white,
                            hintText: "ادخل كلمة المرور",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            fillColor: textFormFileColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 44, left: 32, right: 32),
                    child: SizedBox(
                      height: 66,
                      child: ElevatedButton(
                        onPressed: () {},
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
                            Text('تسجيل الدخول         '),
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
                      "ليس لديك حساب؟",
                      style: TextStyle(color: appGrayColor),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "تسجيل جديد",
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
                    padding:
                        const EdgeInsets.only(top: 16, left: 32, right: 32),
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

import 'package:budget_tracker/Constants.dart';
import 'package:budget_tracker/controllers/takeInfoController.dart';
import 'package:budget_tracker/router/router.dart';
import 'package:budget_tracker/style.dart';
import 'package:budget_tracker/view/paints/mainCanva.dart';
import 'package:budget_tracker/view/widgets/customInputFiled.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakeInfoScreen extends StatelessWidget {
  TakeInfoScreen({super.key});
  final TakeInfoController _controller = Get.put(TakeInfoController());

  @override
  Widget build(BuildContext context) {
    var WIDTH = Get.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          CustomPaint(
            size: Size(WIDTH, (WIDTH * 0.2365038560411311).toDouble()),
            painter: MainCanava(),
          ),
          ListView(
            children: [
              SizedBox(
                height: Get.height * 0.12,
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
              const SizedBox(
                height: 10,
              ),
              CustomInputFiled(
                userController: _controller.firstNameController,
                labelName: "الاسم",
                hintText: "ادخل الاسم",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomInputFiled(
                userController: _controller.incomeController,
                labelName: "الدخل",
                hintText: "ادخل مجموع الدخل الشهري",
                inputType: InputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomInputFiled(
                userController: _controller.obligationsController,
                labelName: "الاتزامات",
                hintText: "ادخل مجموع الاتزامات الشهري",
                inputType: InputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  height: 66,
                  child: ElevatedButton(
                    onPressed: () async {
                      print(storage.read("uid"));
                      var userDate = FirebaseFirestore.instance
                          .collection("users")
                          .doc(storage.read("uid"));
                      await userDate.update(
                          {"name": _controller.firstNameController.text});
                      await userDate.update({
                        "income": num.parse(_controller.incomeController.text)
                      });
                      await userDate.update({
                        "total_obligations_amount":
                            num.parse(_controller.obligationsController.text)
                      });
                      Get.toNamed(RouterName.homepage);
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
                    child: const Text("الدخول"),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:budget_tracker/controller/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

enum InputType { email, password, normal }

class CustomInputFiled extends StatelessWidget {
  const CustomInputFiled({
    super.key,
    required this.userController,
    required this.labelName,
    required this.hintText,
    required this.validator,
    this.inputType = InputType.normal,
  });

  final TextEditingController userController;
  final String labelName;
  final String hintText;
  final InputType inputType;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              labelName,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            validator: validator,
            obscureText: inputType == InputType.password ? true : false,
            style: const TextStyle(color: Colors.white),
            controller: userController,
            decoration: InputDecoration(
              suffixIconColor: Colors.white,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              fillColor: textFormFileColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: inputType == InputType.password
                  ? Padding(
                      padding: const EdgeInsetsDirectional.only(end: 12.0),
                      child: GestureDetector(
                        child: true
                            ? const Icon(
                                Icons.visibility,
                              )
                            : const Icon(
                                Icons.visibility_off,
                              ),
                        onTap: () {
                          !true;
                          if (kDebugMode) {
                            print("done");
                          }
                        },
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}

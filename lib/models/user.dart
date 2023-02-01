import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:budget_tracker/models/elementModel.dart' as e;
import 'dart:convert' as convert;

class User {
  String uid;
  String name;
  String? personal_image;
  num income;
  num total_obligations_amount;
  List<e.Element>? elements;

  User({
    required this.uid,
    required this.name,
    required this.personal_image,
    required this.income,
    required this.total_obligations_amount,
    required this.elements,
  });

  factory User.fromJson({required Map<String, dynamic> json}) {
    // find and create elements object
    List<e.Element>? tempElements = [];
    for (var element in json["elements"]) {
      tempElements.add(e.Element.fromJson(element));
    }

    return User(
      total_obligations_amount: json["total_obligations_amount"],
      income: json["income"],
      uid: json["uid"],
      name: json["name"],
      personal_image: json["personal_image"],
      elements: tempElements,
    );
  }

  @override
  String toString() {
    return '''User: 
              uid = $uid
              name = $name
              presonal_image = $personal_image
              income = $income
              total_obligations_amount = $total_obligations_amount
              elements = $elements
              ''';
  }
}

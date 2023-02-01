import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Element {
  Element({
    required this.elementName,
    required this.elementPrice,
    required this.elementType,
    required this.elementDate,
    required this.userCredential,
  });

  final String elementName;
  final num elementPrice;
  final String elementType;
  final DateTime elementDate;
  String userCredential;

  factory Element.fromRawJson(String str) => Element.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Element.fromJson(Map<String, dynamic> json) {
    // convert timestamp to DataTime object
    Timestamp t = json["elementDate"] as Timestamp;
    DateTime dt = t.toDate();

    return Element(
      elementName: json["elementName"],
      elementPrice: json["elementPrice"],
      elementType: json["elementType"],
      elementDate: dt,
      userCredential: json["userCredential"],
    );
  }

  Map<String, dynamic> toJson() => {
        "elementName": elementName,
        "elementPrice": elementPrice,
        "elementType": elementType,
        "elementDate": elementDate,
        "userCredential": userCredential,
      };
  @override
  String toString() {
    return "Element:  elementName = $elementName, elementPrice = $elementPrice, elementType = $elementType, elementDate = $elementDate";
  }
}

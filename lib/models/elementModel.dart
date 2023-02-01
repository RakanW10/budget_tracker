import 'dart:convert';

import 'package:budget_tracker/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Element {
  Element({
    required this.elementName,
    required this.elementPrice,
    required this.elementType,
    required this.elementDate,
  });

  final String elementName;
  final num elementPrice;
  final String elementType;
  final DateTime elementDate;

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
    );
  }

  Map<String, dynamic> toJson() => {
        "elementName": elementName,
        "elementPrice": elementPrice,
        "elementType": elementType,
        "elementDate": elementDate,
      };
  @override
  String toString() {
    return "Element:  elementName = $elementName, elementPrice = $elementPrice, elementType = $elementType, elementDate = $elementDate";
  }
}

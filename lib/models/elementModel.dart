import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Element {
  Element({
    required this.elementName,
    required this.elementPrice,
    required this.elementType,
    required this.elementDate,
    required this.elementPayType,
  });

  final String elementName;
  final num elementPrice;
  final String elementType;
  final DateTime elementDate;
  final String elementPayType;

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
      elementPayType: json["elementPayType"],
    );
  }

  Map<String, dynamic> toJson() => {
        "elementName": elementName,
        "elementPrice": elementPrice,
        "elementType": elementType,
        "elementDate": elementDate,
        "elementPayType": elementPayType,
      };
  @override
  String toString() {
    return "Element:  elementName = $elementName, elementPrice = $elementPrice, elementType = $elementType, elementDate = $elementDate, elementPayType = $elementPayType ";
  }
}

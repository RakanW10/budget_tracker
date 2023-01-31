import 'dart:convert';

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

  factory Element.fromJson(Map<String, dynamic> json) => Element(
        elementName: json["elementName"],
        elementPrice: json["elementPrice"],
        elementType: json["elementType"],
        elementDate: json["elementDate"],
      );

  Map<String, dynamic> toJson() => {
        "elementName": elementName,
        "elementPrice": elementPrice,
        "elementType": elementType,
        "elementDate": elementDate,
      };
}

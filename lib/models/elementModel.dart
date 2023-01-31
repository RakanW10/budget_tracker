import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class Element {
  Element({
    required this.elementName,
    required this.elementPrice,
    required this.elementType,
  });

  final String? elementName;
  final num? elementPrice;
  final String? elementType;
}

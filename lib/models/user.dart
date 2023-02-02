import 'package:budget_tracker/models/elementModel.dart' as e;

class OurUser {
  String uid;
  String name;
  String? personal_image;
  num income;
  num total_obligations_amount;
  List<e.Element> elements;

  OurUser({
    required this.uid,
    required this.name,
    required this.personal_image,
    required this.income,
    required this.total_obligations_amount,
    required this.elements,
  });

  factory OurUser.fromJson({required Map<String, dynamic> json}) {
    // find and create elements object
    List<e.Element>? tempElements = [];
    for (var element in json["elements"]) {
      tempElements.add(e.Element.fromJson(element));
    }
    return OurUser(
      total_obligations_amount: json["total_obligations_amount"],
      income: json["income"],
      uid: json["uid"],
      name: json["name"],
      personal_image: json["personal_image"],
      elements: tempElements,
    );
  }
  Map<String, dynamic> toJson() {
    List elementsData = [];
    for (var e in elements) {
      elementsData.add(e.toJson());
    }
    Map<String, dynamic> data = {};
    data["uid"] = uid;
    data["name"] = name;
    data["personal_image"] = personal_image;
    data["income"] = income;
    data["total_obligations_amount"] = total_obligations_amount;
    data["elements"] = elementsData;

    return data;
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

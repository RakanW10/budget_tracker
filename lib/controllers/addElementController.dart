import 'package:budget_tracker/models/elementModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

addElement(String collectionName, String elementName, num elementPrice,
    String elementType, DateTime elementDate) async {
  Element element = Element(
    elementName: elementName,
    elementPrice: elementPrice,
    elementType: elementType,
    elementDate: elementDate,
  );
  await FirebaseFirestore.instance
      .collection(collectionName)
      .add(element.toJson());
}

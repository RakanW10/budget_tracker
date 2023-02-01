import 'package:budget_tracker/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:budget_tracker/models/elementModel.dart';

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

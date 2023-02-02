import 'package:budget_tracker/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'homePageController.dart' as h;
import 'package:budget_tracker/models/elementModel.dart';

// import 'homePageController.dart';

// final HomepageController _homepageController = Get.find();

addElement(String elementName, num elementPrice, String elementType,
    DateTime elementDate, String elementPayType, int? inOrOut) async {
  Element element = Element(
    elementName: elementName,
    elementPrice: inOrOut == 0 ? elementPrice : elementPrice * -1,
    elementType: elementType,
    elementDate: elementDate,
    elementPayType: elementPayType,
  );
  await FirebaseFirestore.instance
      .collection('users')
      .doc(storage.read('uid'))
      .set(
    {
      'elements': FieldValue.arrayUnion([element.toJson()])
    },
    SetOptions(merge: true),
  );
  // _homepageController.addElementTemp();
}

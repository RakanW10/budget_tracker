import 'package:budget_tracker/controllers/addElementController.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../constants.dart';
import '../style.dart';
import 'widgets/customInputFiled.dart';

class AddElementPage extends StatefulWidget {
  const AddElementPage({super.key});

  @override
  State<AddElementPage> createState() => _AddElementPageState();
}

class _AddElementPageState extends State<AddElementPage> {
  TextEditingController elementName = TextEditingController();

  TextEditingController elementPrice = TextEditingController();

  DateRangePickerController elementDate = DateRangePickerController();

  var elementTypes = ["طعام", "مواصلات", "فواتير", "تسوق", "دخل"];

  @override
  Widget build(BuildContext context) {
    String? selectedValue;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 8,
        title: const Text(
          'اضافة عنصر',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          storage.read("personal-image") != null
              ? Image.network(storage.read("personal-image"))
              : Image.asset("assets/images/defualtImage.png"),
        ],
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            SfDateRangePicker(
              // rangeTextStyle: TextStyle(color: Colors.white),
              controller: elementDate,
              headerStyle: DateRangePickerHeaderStyle(
                textAlign: TextAlign.center,
                textStyle: const TextStyle(color: Colors.white),
                backgroundColor: calenderBlackColor,
              ),
              backgroundColor: calenderBlackColor,
              selectionMode: DateRangePickerSelectionMode.single,
              monthCellStyle: const DateRangePickerMonthCellStyle(
                textStyle: TextStyle(color: Colors.white),
                todayTextStyle: TextStyle(color: Colors.yellow),
                todayCellDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              monthViewSettings: DateRangePickerMonthViewSettings(
                showTrailingAndLeadingDates: false,
                enableSwipeSelection: true,
                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  backgroundColor: calenderBlackColor,
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            CustomInputFiled(
              userController: elementName,
              labelName: "اسم العنصر",
              hintText: "ادخل اسم العنصر",
              inputType: InputType.normal,
            ),
            CustomInputFiled(
              userController: elementPrice,
              labelName: "سعر العنصر",
              hintText: "ادخل سعر العنصر",
              inputType: InputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          '                     اختر النوع',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: elementTypes
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.grey,
                  buttonHeight: 66,
                  buttonWidth: 300,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: elevatedButtonColor,
                  ),
                  buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  dropdownWidth: 200,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: elevatedButtonColor,
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, bottom: 20, top: 22),
              child: SizedBox(
                height: 66,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // print(elementDate.selectedDate);
                    if (elementName.text.isNotEmpty ||
                        elementPrice.text.isNotEmpty ||
                        selectedValue!.isNotEmpty ||
                        selectedValue != null) {
                      addElement(
                          "elements",
                          elementName.text,
                          num.parse(elementPrice.text),
                          selectedValue!,
                          elementDate.selectedDate ?? DateTime.now());
                      if (kDebugMode) {
                        print("done");
                      }
                      elementName.clear();
                      elementPrice.clear();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      elevatedButtonColor,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Text('اضافة العنصر'),
                ),
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.05,
            // ),
          ],
        ),
      ),
    );
  }
}

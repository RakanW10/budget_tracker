import 'package:budget_tracker/controllers/addElementController.dart';
import 'package:budget_tracker/router/router.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:toggle_switch/toggle_switch.dart';

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

  var elementTypes = ["Food", "Transport", "Bill", "Shopping", "Income"];
  var elementPayTypes = ["cash", "apple-pay", "stc-pay", "card"];
  String? selectedValue;
  String? selectedValue1;
  int? selectedValue2 = 1;
  bool isOutCome = true;

  @override
  Widget build(BuildContext context) {
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
          storage.read("personal_image") != null
              ? Image.network(storage.read("personal_image"))
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
              padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
              child: Center(
                child: ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [Colors.green[800]!],
                    [Colors.red[800]!]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: selectedValue2,
                  totalSwitches: 2,
                  labels: const ['دخل', 'مصروف'],
                  radiusStyle: true,
                  onToggle: (index) {
                    setState(() {
                      selectedValue2 = index;
                      isOutCome = index == 1 ? true : false;
                    });
                    // print('switched to: $index');
                  },
                ),
              ),
            ),
            isOutCome
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 32, right: 32),
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
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
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
                  )
                : const SizedBox(),
            isOutCome
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 32, right: 32),
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
                                '                     اختر طريقة الدفع',
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
                        items: elementPayTypes
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
                        value: selectedValue1,
                        onChanged: (value) {
                          setState(() {
                            selectedValue1 = value;
                          });
                          // print(selectedValue);
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 66,
                        buttonWidth: 300,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
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
                  )
                : const SizedBox(),

            Padding(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, bottom: 20, top: 22),
              child: SizedBox(
                height: 66,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // print(elementDate.selectedDate);
                    // print(selectedValue);s
                    if (elementName.text.isNotEmpty ||
                        elementPrice.text.isNotEmpty ||
                        selectedValue!.isNotEmpty ||
                        selectedValue != null) {
                      addElement(
                          elementName.text,
                          num.parse(elementPrice.text),
                          selectedValue!,
                          elementDate.selectedDate ?? DateTime.now(),
                          selectedValue1!,
                          selectedValue2!);
                      if (kDebugMode) {
                        print("done");
                      }
                      elementName.clear();
                      elementPrice.clear();
                      Get.toNamed(RouterName.homepage);
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

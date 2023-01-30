import 'package:budget_tracker/controller/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../Constants.dart';
import '../style.dart';
import 'widgets/customInputFiled.dart';

class AddElementPage extends StatelessWidget {
  AddElementPage({super.key});
  TextEditingController elementName = TextEditingController();
  TextEditingController elementPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    const Text(
                      'اضافة عنصر',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    storage.read("personal-image") != null
                        ? Image.network(storage.read("personal-image"))
                        : Image.asset("assets/images/defualtImage.png"),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SfDateRangePicker(
                // rangeTextStyle: TextStyle(color: Colors.white),
                headerStyle: DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(color: Colors.white),
                  backgroundColor: calenderBlackColor,
                ),
                backgroundColor: calenderBlackColor,
                onSelectionChanged: (v) {},
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
                padding: const EdgeInsets.only(top: 44, left: 32, right: 32),
                child: SizedBox(
                  height: 66,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

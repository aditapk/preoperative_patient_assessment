import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';
import 'package:preoperative_patient_assessment/screens/other_screen.dart';
import 'package:preoperative_patient_assessment/widgets/card_selection_widget.dart';

class HematologicScreen extends StatefulWidget {
  const HematologicScreen({super.key});

  @override
  State<HematologicScreen> createState() => _HematologicScreenState();
}

class _HematologicScreenState extends State<HematologicScreen> {
  String title = 'Hematologic';
  List<CheckListDataModel> hematologicList = [
    CheckListDataModel(
      title:
          'Abnormal laboratory results (eg. \n\u2022 Hb<10g/dL\n\u2022 WBC<3,000\n\u2022 ANC<1,500\n\u2022 plt<100,000)',
      check: false,
    ),
    CheckListDataModel(title: 'Bleeding disorder', check: false),
    CheckListDataModel(
        title: 'Hematological disorder\n(eg. thalassemia)', check: false),
  ];

  PatientInformationController controller =
      Get.find<PatientInformationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: ListView(
                  children: hematologicList.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 2.5),
                      child: CardSelectionWidget(
                          value: e.check,
                          title: e.title,
                          onChanged: (value) {
                            setState(() {
                              e.check = value!;
                              if (value) {
                                controller.criteriaForPreOperativeConsultation
                                    .hematologic
                                    .add(e.title);
                              } else {
                                controller.criteriaForPreOperativeConsultation
                                    .hematologic
                                    .remove(e.title);
                              }
                            });
                          }),
                    );
                  }).toList(),
                  //cardiovascularList.map((e) {return CardSelectionWidget(value: e.check, title: e.title, onChanged: (){});}.toList(),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Get.to(() => const OtherScreen());
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.keyboard_arrow_right),
                    Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

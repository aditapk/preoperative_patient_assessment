import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';

import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';
import 'package:preoperative_patient_assessment/screens/summary_consult_screen.dart';

import 'package:preoperative_patient_assessment/widgets/card_selection_widget.dart';

import '../dialogs/confirmation_text_dialog.dart';
import '../dialogs/summary_consult_dialog.dart';
import 'registration_screen.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({super.key});

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  List<CheckListDataModel> otherList = [
    CheckListDataModel(
        title: 'Morbid obesity (Weight for height < P95)', check: false),
    CheckListDataModel(
        title:
            'Operation need post-operative PICU (eg. \n\u2022 scoliosis operation\n\u2022 severe OSA that need post-operative ventilatory support)',
        check: false)
  ];
  PatientInformationController controller =
      Get.find<PatientInformationController>();

  checkExistSelection() {
    return !controller.criteriaForPreOperativeConsultation.isEmpty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other'),
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
                  children: otherList.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 2.5),
                      child: CardSelectionWidget(
                          value: e.check,
                          title: e.title,
                          onChanged: (value) {
                            setState(() {
                              e.check = value!;
                              if (value) {
                                controller
                                    .criteriaForPreOperativeConsultation.others
                                    .add(e.title);
                              } else {
                                controller
                                    .criteriaForPreOperativeConsultation.others
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
                onPressed: () async {
                  var result = await Get.dialog(
                    ConfirmationTextDialog(
                      content: const Center(
                          child: Text('Are you sure to finish this form?')),
                      onCancel: () {
                        Get.back(result: false);
                      },
                      onOK: () async {
                        Get.back(result: true);
                      },
                    ),
                  );

                  if (result) {
                    if (checkExistSelection()) {
                      Get.to(() => const SummaryConsultScreen());
                    } else {
                      var result = await Get.dialog(
                        SummaryConsultDialog(
                          content: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Theme.of(Get.context!).primaryColor,
                                  size: 100,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Consult SPAC',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ]),
                          onOK: () {
                            // update
                            controller.criteriaForPreOperativeConsultation
                                .summary = 'Consult SPAC';
                            Get.back(result: true);
                          },
                        ),
                      );

                      if (result) {
                        // update criteria ... to current patient
                        controller.addCriteriaForPreOperativeConsultation();

                        Get.to(() => const RegistrationScreen());
                      }
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
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

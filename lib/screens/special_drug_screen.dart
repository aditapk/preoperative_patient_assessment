import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';

import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';

import 'package:preoperative_patient_assessment/widgets/card_selection_widget.dart';

import '../dialogs/confirmation_text_dialog.dart';
import 'summary_lab_sugges_screen.dart';

class SpecialDrugScreen extends StatefulWidget {
  const SpecialDrugScreen({super.key});

  @override
  State<SpecialDrugScreen> createState() => _SpecialDrugScreenState();
}

class _SpecialDrugScreenState extends State<SpecialDrugScreen> {
  PatientInformationController patientInfoController =
      Get.find<PatientInformationController>();
  List<CheckListDataModel> specialDrugList = [
    CheckListDataModel(title: 'Anticoagulant drug', check: false),
    CheckListDataModel(title: 'Antipsychotic drug', check: false),
    CheckListDataModel(title: 'Digoxin drug', check: false),
    CheckListDataModel(title: 'Diuretics drug', check: false),
    CheckListDataModel(title: 'Steroid drug', check: false),
  ];
  final String title = 'Special drug';
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
              child: ListView(
                children: specialDrugList.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CardSelectionWidget(
                        value: e.check,
                        title: e.title,
                        onChanged: (value) {
                          setState(() {
                            e.check = value!;
                            if (value) {
                              patientInfoController.labInvestigration
                                  .addSpecialDrugItem(e.title);
                            } else {
                              patientInfoController.labInvestigration
                                  .removeSpecialDrugItem(e.title);
                            }
                          });
                        }),
                  );
                }).toList(),
                //cardiovascularList.map((e) {return CardSelectionWidget(value: e.check, title: e.title, onChanged: (){});}.toList(),
              ),
            ),
            const SizedBox(
              height: 10,
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
                  // confirm the form
                  Get.dialog(ConfirmationTextDialog(
                    content: const Text('Are you sure to finish this form?'),
                    onCancel: () {
                      Get.back();
                    },
                    onOK: () {
                      // to summary
                      Get.offAll(() => const SummaryLabSuggessionScreen());
                    },
                  ));
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

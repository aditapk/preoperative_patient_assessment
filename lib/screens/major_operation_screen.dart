import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';
import 'package:preoperative_patient_assessment/screens/special_drug_screen.dart';

import '../widgets/card_selection_widget.dart';

class MajorOperationScreen extends StatefulWidget {
  const MajorOperationScreen({super.key});

  @override
  State<MajorOperationScreen> createState() => _MajorOperationScreenState();
}

class _MajorOperationScreenState extends State<MajorOperationScreen> {
  PatientInformationController patientInfoController =
      Get.find<PatientInformationController>();
  List<CheckListDataModel> majorOperationList = [
    CheckListDataModel(title: 'Hepatobiliary surgery', check: false),
    CheckListDataModel(title: 'Intraperitoneal surgery', check: false),
    CheckListDataModel(title: 'Intrathoracic surgery', check: false),
    CheckListDataModel(title: 'Major spine surgery', check: false),
    CheckListDataModel(title: 'Neurosurgery/INR', check: false),
    CheckListDataModel(title: 'Vascular surgery', check: false),
    CheckListDataModel(
        title:
            'Prolong procedure (> 3 hours) associated with large fluid shift, blood loss or both',
        check: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Major Operation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: majorOperationList.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 2.5),
                    child: CardSelectionWidget(
                        value: e.check,
                        title: e.title,
                        onChanged: (value) {
                          setState(() {
                            e.check = value!;
                            if (value) {
                              patientInfoController.labInvestigration
                                  .addMajorOperationItem(e.title);
                            } else {
                              patientInfoController.labInvestigration
                                  .removeMajorOperationItem(e.title);
                            }
                          });
                        }),
                  );
                }).toList(),
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
                  // Go to special drug
                  Get.to(() => const SpecialDrugScreen());
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

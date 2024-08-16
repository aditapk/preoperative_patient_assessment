import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';
import 'package:preoperative_patient_assessment/screens/major_operation_screen.dart';

import '../widgets/card_selection_widget.dart';

class ComobidityScreen extends StatefulWidget {
  const ComobidityScreen({super.key});

  @override
  State<ComobidityScreen> createState() => _ComobidityScreenState();
}

class _ComobidityScreenState extends State<ComobidityScreen> {
  List<CheckListDataModel> comorbidityList = [
    CheckListDataModel(title: 'Autoimmune', check: false),
    CheckListDataModel(title: 'CNS', check: false),
    CheckListDataModel(title: 'CVS/hypertension', check: false),
    CheckListDataModel(title: 'DM', check: false),
    CheckListDataModel(title: 'Hematologic', check: false),
    CheckListDataModel(title: 'Hepatobiliary', check: false),
    CheckListDataModel(title: 'Obesity (BMI >= 30)', check: false),
    CheckListDataModel(title: 'Pulmonary', check: false),
    CheckListDataModel(title: 'Renal', check: false),
  ];

  comorbidityState(String title) {
    if (title == 'Obesity (BMI >= 30)') {
      return 'Obesity';
    }
    if (title == 'CVS/hypertension') {
      return 'CVS';
    }
    return title;
  }

  PatientInformationController patientInfoController =
      Get.find<PatientInformationController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comorbidity'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: comorbidityList.map((e) {
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
                                  .addComorbidityItem(
                                      comorbidityState(e.title));
                            } else {
                              patientInfoController.labInvestigration
                                  .removeComorbidityItem(
                                      comorbidityState(e.title));
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
                    foregroundColor: Colors.white),
                onPressed: () {
                  // Go to Major Operation Screen
                  Get.to(() => const MajorOperationScreen());
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

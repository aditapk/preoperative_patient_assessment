import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';

import 'package:preoperative_patient_assessment/widgets/card_selection_widget.dart';

import 'special_drug_screen.dart';

class RiskAssociatedCondictionsScreen extends StatefulWidget {
  const RiskAssociatedCondictionsScreen({super.key});

  @override
  State<RiskAssociatedCondictionsScreen> createState() =>
      _RiskAssociatedCondictionsState();
}

class _RiskAssociatedCondictionsState
    extends State<RiskAssociatedCondictionsScreen> {
  List<CheckListDataModel> riskAssociatedConditions = [
    CheckListDataModel(title: 'Cystic fibrosis', check: false),
    CheckListDataModel(title: 'CVS', check: false),
    CheckListDataModel(title: 'DM', check: false),
    CheckListDataModel(title: 'Emergency (trauma)', check: false),
    CheckListDataModel(title: 'Hepatobiliary', check: false),
    CheckListDataModel(title: 'History of airway problem', check: false),
    CheckListDataModel(title: 'PCA < 60 weeks', check: false),
    CheckListDataModel(title: 'Pulmonary', check: false),
    CheckListDataModel(title: 'Renal', check: false),
    CheckListDataModel(title: 'Sickle cell', check: false),
  ];
  final String title = 'Risk associated conditions';
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
              child: ListView(
                children: riskAssociatedConditions.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 2.5),
                    child: CardSelectionWidget(
                        value: e.check,
                        title: e.title,
                        onChanged: (value) {
                          setState(() {
                            e.check = value!;
                            if (value) {
                              controller.labInvestigration
                                  .addRiskAssociatedConditionsItem(e.title);
                            } else {
                              controller.labInvestigration
                                  .removeRiskAssociatedConditionsItem(e.title);
                            }
                          });
                        }),
                  );
                }).toList(),
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
                  // go to special drug
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

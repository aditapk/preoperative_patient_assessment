import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';
import 'package:preoperative_patient_assessment/screens/functional_capacity_METs.dart';
import 'package:preoperative_patient_assessment/screens/underlying_disease_screen.dart';
import 'package:preoperative_patient_assessment/widgets/card_selection_widget.dart';

class RevisedCardiacRiskIndexScreen extends StatefulWidget {
  const RevisedCardiacRiskIndexScreen({super.key});

  @override
  State<RevisedCardiacRiskIndexScreen> createState() =>
      _RevisedCardiacRiskIndexScreenState();
}

class _RevisedCardiacRiskIndexScreenState
    extends State<RevisedCardiacRiskIndexScreen> {
  List<CheckListDataModel> revisedCardiacRiskIndexList = [
    CheckListDataModel(title: 'Prior TIA or CVA', check: false),
    CheckListDataModel(
        title: 'Diabets mellitus requiring insulin therapy', check: false),
    CheckListDataModel(title: 'Serum creatinine \u2265 2mg/dL', check: false),
    CheckListDataModel(
        title: 'History of conronary artery disease', check: false),
    CheckListDataModel(title: 'High-risk surgery', check: false),
  ];

  int riskIndexScore = 0;
  PatientInformationController controller =
      Get.find<PatientInformationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revised Cardiac Risk Index: RCRI'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RCRI : $riskIndexScore',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: revisedCardiacRiskIndexList.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 2.5),
                    child: CardSelectionWidget(
                        value: e.check,
                        title: e.title,
                        onChanged: (value) {
                          setState(() {
                            e.check = value!;
                            if (value) {
                              setState(() {
                                riskIndexScore += 1;
                              });
                            } else {
                              riskIndexScore -= 1;
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
                  // update risk index score
                  controller.criteriaForPreOperativeConsultation
                      .revisedCardiacRiskIndex = riskIndexScore;

                  if (riskIndexScore < 2) {
                    // 0 - 1 : low risk
                    Get.to(() => const UnderlyingDiseaseScreen());
                  } else {
                    // >= 2 :
                    Get.to(() => const FunctionalCapacityMETsScreen());
                  }
                  // Go to Major Operation Screen
                  // Get.to(() => const MajorOperationScreen());
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

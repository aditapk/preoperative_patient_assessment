import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';

import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';
import 'package:preoperative_patient_assessment/screens/risk_associated_conditions_screen.dart';
import 'package:preoperative_patient_assessment/widgets/card_selection_widget.dart';

import '../dialogs/confirmation_text_dialog.dart';

class RiskforOperationBleedingScreen extends StatefulWidget {
  const RiskforOperationBleedingScreen({super.key});

  @override
  State<RiskforOperationBleedingScreen> createState() =>
      _RiskforOperationBleedingScreenState();
}

class _RiskforOperationBleedingScreenState
    extends State<RiskforOperationBleedingScreen> {
  List<CheckListDataModel> riskOperationBleeding = [
    CheckListDataModel(title: 'Fracture femur or pelvis', check: false),
    CheckListDataModel(title: 'Hepatectomy', check: false),
    CheckListDataModel(title: 'Hip surgery', check: false),
    CheckListDataModel(title: 'Neurosurgery', check: false),
    CheckListDataModel(title: 'Osteotomy', check: false),
    CheckListDataModel(title: 'Scoliosis', check: false),
  ];
  PatientInformationController controller =
      Get.find<PatientInformationController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var result = await Get.dialog(
          ConfirmationTextDialog(
            content: const Text('Are you sure to finish this form?'),
            onCancel: () {
              Get.back(result: false);
            },
            onOK: () {
              Get.back(result: true);
            },
          ),
        );
        return result;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Risk for operation bleeding'),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: riskOperationBleeding.map((e) {
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
                                          .addRiskForOperationBleedingItem(
                                              e.title);
                                    } else {
                                      controller.labInvestigration
                                          .removeComorbidityItem(e.title);
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
                          Get.to(() => const RiskAssociatedCondictionsScreen());
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
          },
        ),
      ),
    );
  }
}

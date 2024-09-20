import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/app_state_controller.dart';
import 'package:preoperative_patient_assessment/screens/consult_screen.dart/pediatrics_consult_screen.dart';

import '../../models/check_list_data_model.dart';
import '../../widgets/card_selection_widget.dart';
import 'pediatrics_evaluation_screen.dart';

class PediatricsOnedaySurgeryCaseScreen extends StatefulWidget {
  const PediatricsOnedaySurgeryCaseScreen({super.key});

  @override
  State<PediatricsOnedaySurgeryCaseScreen> createState() =>
      _PediatricsOnedaySurgeryCaseScreenState();
}

class _PediatricsOnedaySurgeryCaseScreenState
    extends State<PediatricsOnedaySurgeryCaseScreen> {
  bool? answer;
  var pediatricsEvalController = Get.find<PedEvalStateController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pediatrics Evaluation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      "Is this patient a one-day\nsurgery case?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Column(
                      children: [
                        CardSelectionWidget(
                            value: answer ?? false,
                            title: "Yes",
                            onChanged: (_) {
                              setState(() {
                                answer = true;
                              });
                            }),
                        const SizedBox(
                          height: 8,
                        ),
                        CardSelectionWidget(
                            value: answer == null ? false : !answer!,
                            title: "No",
                            onChanged: (_) {
                              setState(() {
                                answer = false;
                              });
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            NextButton(
              onPressed: () {
                if (answer ?? false) {
                  // YES, Test No. 8 [OK]
                  String consult = "SPAC";
                  pediatricsEvalController.setConsult(consult);
                  Get.to(() => ConsultScreen(title: consult));
                } else {
                  // No, Test No. 9 [OK]
                  String consult = "No further consultation";
                  pediatricsEvalController.setConsult(consult);
                  Get.to(() => ConsultScreen(
                        title: consult,
                        fontSize: 26,
                      ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

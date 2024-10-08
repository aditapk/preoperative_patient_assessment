import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/screens/consult_screen/consult_screen.dart';
import 'package:preoperative_patient_assessment/screens/pediatrics_evaluation/pediatrics_oneday_surgery_case_screen.dart';
import 'package:preoperative_patient_assessment/screens/widgets/next_button.dart';
import 'package:preoperative_patient_assessment/widgets/card_selection_widget.dart';

import '../../controllers/app_state_controller.dart';

class PediatricsPostOperativeICUScreen extends StatefulWidget {
  const PediatricsPostOperativeICUScreen({super.key, this.isEdit});

  final bool? isEdit;

  @override
  State<PediatricsPostOperativeICUScreen> createState() =>
      _PediatricsPostOperativeICUScreenState();
}

class _PediatricsPostOperativeICUScreenState
    extends State<PediatricsPostOperativeICUScreen> {
  bool? answer;

  var pediatricsEvaluationController = Get.find<PedEvalStateController>();
  var patientStateController = Get.find<PatientStateController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isEdit ?? false) {
      answer =
          patientStateController.pediatricsEvaluation!.isPostOperativeICU;
    }
  }

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
                      "Does the patient need\npostoperative ICU?",
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
                  // set answer
                  pediatricsEvaluationController.setPostOperativeICU(true);
                  // YES, Test No. 6 [OK]
                  String consult = 'PED';
                  pediatricsEvaluationController.setConsult(consult);
                  // update patient state
                  patientStateController
                      .setPediatricsEval(pediatricsEvaluationController.state!);
                  // go to consult
                  Get.to(() => ConsultScreen(
                    isEdit: widget.isEdit,
                    title: consult),
                    routeName: 'consult-information');
                } else {
                  // set answer
                  pediatricsEvaluationController.setPostOperativeICU(false);
                  // No, Test No. 7 [OK]
                  Get.to(() => PediatricsOnedaySurgeryCaseScreen(
                    isEdit: widget.isEdit,
                  ),
                  routeName: 'pediatrics-oneday-surgery');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

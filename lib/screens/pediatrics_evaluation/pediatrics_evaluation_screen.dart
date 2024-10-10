import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/app_state_controller.dart';
import 'package:preoperative_patient_assessment/controllers/pediatric_evaluation_state.dart';
import 'package:preoperative_patient_assessment/screens/pediatrics_evaluation/pediatrics_postoperative_icu_screen.dart';
import 'package:preoperative_patient_assessment/screens/widgets/condition_card.dart';
import 'package:preoperative_patient_assessment/screens/widgets/next_button.dart';

import '../../widgets/card_selection_widget.dart';
import '../../models/pediatrics_evaluation_model.dart';

class PediatricsEvaluationScreen extends StatefulWidget {
  const PediatricsEvaluationScreen({super.key, this.isEdit});

  final bool? isEdit;
  @override
  State<PediatricsEvaluationScreen> createState() =>
      _PediatricsEvaluationScreenState();
}

class _PediatricsEvaluationScreenState
    extends State<PediatricsEvaluationScreen> {
  // patient information
  var patientStateController = Get.find<PatientStateController>();
  // pediatrics evaluation state
  var pediatricsEvaluationController = Get.put(PedEvalStateController());

  var cvsConditionController = Get.put(CVSConditionController()); // CVS
  var rsConditionController = Get.put(RSCondictionController()); // RS
  var cnsConditionController = Get.put(CNSConditionController()); // CNS
  var endocrineConditionController = Get.put(
      EndocrineConditionController()); // Endocrine (Uncontrolled conditions)
  var hematoConditionController =
      Get.put(HematoConditionController()); // Hemato
  var otherConditionController = Get.put(OtherConditionController()); // Other
  // text on comment
  TextEditingController otherCommentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // if BMI >= 30 : true, otherwise false
    // Test No. 4, 5 [OK, OK]
    otherConditionController.state[0].check =
        patientStateController.state!.bMI >= 30.0;

    if (widget.isEdit ?? false) {
      // update evaluating condition
      // CVS condition
      cvsConditionController
          .setState(patientStateController.pediatricsEvaluation!.cvs);
      // RS condition
      rsConditionController
          .setState(patientStateController.pediatricsEvaluation!.rs);
      // CNS condition
      cnsConditionController
          .setState(patientStateController.pediatricsEvaluation!.cns);
      // endocrine condition
      endocrineConditionController
          .setState(patientStateController.pediatricsEvaluation!.endocrine);
      // hemato condition
      hematoConditionController
          .setState(patientStateController.pediatricsEvaluation!.hemato);
      // other condition
      otherConditionController
          .setState(patientStateController.pediatricsEvaluation!.other);
      // commment
      if (patientStateController.pediatricsEvaluation!.comment != null) {
        otherCommentController.text =
            patientStateController.pediatricsEvaluation!.comment!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evaluation'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Does the patient have any of the following conditions?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<CVSConditionController>(
                    init: cvsConditionController,
                    builder: (controller) => ConditionCard(
                          title: 'CVS',
                          conditions: controller.state
                              .map(
                                (e) => CardSelectionWidget(
                                  value: e.check,
                                  title: e.title,
                                  onChanged: (value) {
                                    controller.change(e.title, value);
                                  },
                                ),
                              )
                              .toList(),
                        )),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<RSCondictionController>(
                  init: rsConditionController,
                  builder: (controller) => ConditionCard(
                    title: 'RS',
                    conditions: controller.state
                        .map(
                          (e) => CardSelectionWidget(
                            value: e.check,
                            title: e.title,
                            onChanged: (value) {
                              controller.change(e.title, value);
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<CNSConditionController>(
                  init: cnsConditionController,
                  builder: (controller) => ConditionCard(
                    title: 'CNS',
                    conditions: controller.state
                        .map(
                          (e) => CardSelectionWidget(
                            value: e.check,
                            title: e.title,
                            onChanged: (value) {
                              controller.change(e.title, value);
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<EndocrineConditionController>(
                  init: endocrineConditionController,
                  builder: (controller) => ConditionCard(
                    title: 'Endocrine (Uncontrolled conditions)',
                    conditions: controller.state
                        .map(
                          (e) => CardSelectionWidget(
                            value: e.check,
                            title: e.title,
                            onChanged: (value) {
                              controller.change(e.title, value);
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<HematoConditionController>(
                  init: hematoConditionController,
                  builder: (controller) => ConditionCard(
                    title: 'Hemato',
                    conditions: controller.state
                        .map(
                          (e) => CardSelectionWidget(
                            value: e.check,
                            title: e.title,
                            onChanged: (value) {
                              controller.change(e.title, value);
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<OtherConditionController>(
                  init: otherConditionController,
                  builder: (controller) => ConditionCard(
                    title: 'Other',
                    conditions: controller.state
                        .map(
                          (e) => CardSelectionWidget(
                            value: e.check,
                            title: e.title,
                            onChanged: (value) {
                              controller.change(e.title, value);

                              // clear other comment text
                              int index = controller.state.indexOf(e);
                              if (index == 1 && value == false) {
                                otherCommentController.text = "";
                              }
                            },
                          ),
                        )
                        .toList(),
                    child: controller.state[1].check
                        ? Padding(
                            padding: const EdgeInsets.all(5),
                            child: TextField(
                              controller: otherCommentController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                NextButton(
                  onPressed: () {
                    // update pediatrics evaluation state
                    updateEvaluationState();
                    // Go to Post Operative ICU : [OK]
                    Get.to(() => PediatricsPostOperativeICUScreen(
                          isEdit: widget.isEdit,
                        ),
                        routeName: 'pediatrics-post-operation-icu');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  cleanState() {
    // Get.delete<CVSConditionController>(); // on close working
    // Get.delete<RSCondictionController>();
    // Get.delete<CNSConditionController>();
    // Get.delete<EndocrineConditionController>();
    // Get.delete<HematoConditionController>();
    // Get.delete<OtherConditionController>();
  }

  updateEvaluationState() {
    // Test No. 10 [OK]
    pediatricsEvaluationController.setState(
      PediatricsEvaluation(
        cvs: cvsConditionController.copy(),
        rs: rsConditionController.copy(),
        cns: cnsConditionController.copy(),
        endocrine: endocrineConditionController.copy(),
        hemato: hematoConditionController.copy(),
        other: otherConditionController.copy(),
        comment: otherCommentController.text,
      ),
    );
  }
}

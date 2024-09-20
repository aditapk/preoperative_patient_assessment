import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/app_state_controller.dart';
import 'package:preoperative_patient_assessment/screens/pediatrics_evaluation/constant_condition.dart';
import 'package:preoperative_patient_assessment/screens/pediatrics_evaluation/pediatric_evaluation_state.dart';
import 'package:preoperative_patient_assessment/screens/pediatrics_evaluation/pediatrics_postoperative_icu_screen.dart';

import '../../models/check_list_data_model.dart';
import '../../widgets/card_selection_widget.dart';
import 'pediatrics_evaluation_model.dart';

class PediatricsEvaluationScreen extends StatefulWidget {
  const PediatricsEvaluationScreen({super.key});

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
                    Get.to(() => const PediatricsPostOperativeICUScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateEvaluationState() {
    // Test No. 10 [OK]
    pediatricsEvaluationController.setState(
      PediatricsEvaluation(
        cvs: cvsConditionController.state,
        rs: rsConditionController.state,
        cns: cnsConditionController.state,
        endocrine: endocrineConditionController.state,
        hemato: hematoConditionController.state,
        other: otherConditionController.state,
        comment: otherCommentController.text,
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        onPressed: onPressed,
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
    );
  }
}

class ConditionCard extends StatelessWidget {
  const ConditionCard({
    super.key,
    required this.title,
    required this.conditions,
    this.child,
  });
  final String title;
  final List<CardSelectionWidget> conditions;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          padding: const EdgeInsets.only(left: 8),
          alignment: Alignment.centerLeft,
          width: double.maxFinite,
          height: 40,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              border: Border.all(
                width: 2.0,
                color: Theme.of(context).primaryColor,
              )),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Column(
                  children: conditions,
                ),
                child ?? Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

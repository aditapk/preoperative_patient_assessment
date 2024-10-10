import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/screens/widgets/condition_card.dart';
import 'package:preoperative_patient_assessment/screens/widgets/next_button.dart';

import 'package:preoperative_patient_assessment/utilities/common_function.dart';
import 'package:preoperative_patient_assessment/utilities/result_estimate_model.dart';

import '../../controllers/app_state_controller.dart';
import '../../models/check_list_data_model.dart';
import '../../widgets/card_selection_widget.dart';
import '../consult_screen/consult_screen.dart';
import '/screens/obesity_evaluation/constant_condition.dart';
import '../../models/obesity_evaluation_model.dart';
import '../../controllers/obesity_evaluation_state.dart';

class ObesityEvaluationScreen extends StatefulWidget {
  const ObesityEvaluationScreen({super.key, this.isEdit});

  final bool? isEdit;
  @override
  State<ObesityEvaluationScreen> createState() =>
      _ObesityEvaluationScreenState();
}

class _ObesityEvaluationScreenState extends State<ObesityEvaluationScreen> {
  // patient information
  var patientStateController = Get.find<PatientStateController>();

  // seletedState
  List<String> selectedState = [];

  List<CheckListDataModel> starState = ObesityCondition.starCondition;

  // obesity evaluation state
  var obisityEvaluationController = Get.put(ObesityEvalStateController());

  // Cardiovascular system
  var cardiovascularSystemController =
      Get.put(ObesityCardiovascularSystemController());

  // Respiratory system
  var respiratorySystemController =
      Get.put(ObesityRespiratorySystemController());

  // Other abnormal conditions
  var otherAbnormalController =
      Get.put(ObesityOtherAbnormalConditionController());
  // STOP BANG score
  var stopBangScoreController = Get.put(StopBANGScoreController());

  @override
  void initState() {
    super.initState();

    if (widget.isEdit ?? false) {
      // Cardiovascular system condition
      cardiovascularSystemController.setState(
          patientStateController.obesityEvaluation!.cardiovascularSystem);
      // respiratory system condition
      respiratorySystemController.setState(
          patientStateController.obesityEvaluation!.respiratorySystem);
      // other abnormal condition
      otherAbnormalController.setState(
          patientStateController.obesityEvaluation!.otherAbnormalConditions);
      // STOP BANG condition
      stopBangScoreController.setState(
          patientStateController.obesityEvaluation!.stopBANGCondition);
    } else {
      // auto check in STOP BANG Condition
      if (patientStateController.state!.bMI > 35) {
        stopBangScoreController.state[4].check = true;
      }
      if (patientStateController.state!.age > 50) {
        stopBangScoreController.state[5].check = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obesity Evaluation'),
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
                GetBuilder<ObesityCardiovascularSystemController>(
                  init: cardiovascularSystemController,
                  builder: (controller) => ConditionCard(
                    title: 'Cardiovascular System',
                    conditions: controller.state
                        .map(
                          (e) => CardSelectionWidget(
                              value: e.check,
                              title: e.title,
                              onChanged: (value) {
                                controller.change(e.title, value);
                                updateSelectedState(value!, e.title);
                              }),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<ObesityRespiratorySystemController>(
                  init: respiratorySystemController,
                  builder: (controller) => ConditionCard(
                    title: 'Respiratory System',
                    conditions: controller.state
                        .map(
                          (e) => CardSelectionWidget(
                              value: e.check,
                              title: e.title,
                              onChanged: (value) {
                                controller.change(e.title, value);
                                updateSelectedState(value!, e.title);
                              }),
                        )
                        .toList(),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: GetBuilder<StopBANGScoreController>(
                        init: stopBangScoreController,
                        builder: (stopBANGcontroller) => ConditionCard(
                          title: 'STOP BANG score',
                          conditions: stopBANGcontroller.state
                              .map(
                                (e) => CardSelectionWidget(
                                    value: e.check,
                                    title: e.title,
                                    onChanged: (value) {
                                      stopBANGcontroller.change(e.title, value);
                                    }),
                              )
                              .toList(),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                '${stopBANGcontroller.level} risk for OSA',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<ObesityOtherAbnormalConditionController>(
                  init: otherAbnormalController,
                  builder: (controller) => ConditionCard(
                    title: 'Other abnormal conditions',
                    conditions: controller.state
                        .map(
                          (e) => CardSelectionWidget(
                              value: e.check,
                              title: e.title,
                              onChanged: (value) {
                                controller.change(e.title, value);
                                updateSelectedState(value!, e.title);
                              }),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                NextButton(
                  onPressed: () {
                    ResultEst result = estimation();
                    // Test No. 40 [OK]
                    updateEvaluationState(result);

                    // set patient state
                    patientStateController
                        .setObesityEval(obisityEvaluationController.state!);
                    Get.to(
                      () => ConsultScreen(
                        isEdit: widget.isEdit,
                        title: result.consult,
                        labs: result.labs,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateSelectedState(bool enable, String state) {
    // add or remove the state
    if (enable) {
      selectedState.add(state);
    } else {
      selectedState.remove(state);
    }
  }

  updateEvaluationState(ResultEst result) {
    obisityEvaluationController.setState(
      ObesityEvaluation(
        cardiovascularSystem: cardiovascularSystemController.copy(),
        respiratorySystem: respiratorySystemController.copy(),
        stopBANGCondition: stopBangScoreController.copy(),
        otherAbnormalConditions: otherAbnormalController.copy(),
        consult: result.consult,
        labs: result.labs,
      ),
    );
  }

  // estimation
  estimation() {
    // initial
    late String consult;
    List<String> labs = [];
    // consult

    // order is correct
    // BMI > 50 : Test No. 32 [OK]
    // Age > 50 and BMI >= 40 : Test No. 33 [OK]
    // STOP BANG score >= 5 : Test No. 34 [OK]
    if (patientStateController.state!.bMI > 50 ||
        (patientStateController.state!.age > 50 &&
            patientStateController.state!.bMI >= 40) ||
        stopBangScoreController.score >= 5) {
      // consult MED
      consult = 'MED';
    } else if (selectedState.isNotEmpty &&
        !isSelectedIn(
          selected: selectedState,
          list: starState,
        )) {
      // consult MED : Test No. 35 [OK]
      consult = 'MED';
    } else if (selectedState.isEmpty) {
      // Test No. 36 [OK]
      consult = 'SPAC';
    } else if (isSelectedIn(
      selected: selectedState,
      list: starState,
    )) {
      // some element is not in star
      bool isElementOutStar = selectedState.any(
        (element) => !starState
            .map(
              (e) => e.title,
            )
            .contains(element),
      );
      if (isElementOutStar) {
        // Test No. 35 [OK]
        consult = 'MED';
      } else {
        // Test No. 37 [OK]
        consult = 'SPAC';
      }
    }
    // labs : Test No. 38
    List<String> everyOneLabs = [
      'CBC/Platelet count',
      'UA',
      'EKG',
      'FBS',
      'BUN',
      'Cr',
      'Electrolytes',
      'Ca',
      'PO4',
      'Mg',
      'CXR',
      'LFT',
      'Lipid profile',
    ];
    // update for everyone
    labs += everyOneLabs;

    // Test No. 39 [OK]
    if (isSelectedIn(
      selected: selectedState,
      list: starState,
    )) {
      labs += ['PT/INR', 'PTT'];
    }

    return ResultEst(
      consult: consult,
      labs: labs,
    );
  }
}

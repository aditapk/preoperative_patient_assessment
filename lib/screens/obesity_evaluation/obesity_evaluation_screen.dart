import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:preoperative_patient_assessment/utilities/common_function.dart';
import 'package:preoperative_patient_assessment/utilities/result_estimate_model.dart';

import '../../controllers/app_state_controller.dart';
import '../../models/check_list_data_model.dart';
import '../../widgets/card_selection_widget.dart';
import '../consult_screen.dart/pediatrics_consult_screen.dart';
import '../pediatrics_evaluation/pediatrics_evaluation_screen.dart';
import '/screens/obesity_evaluation/constant_condition.dart';
import 'obesity_evaluation_model.dart';
import 'obesity_evaluation_state.dart';

class ObesityEvaluationScreen extends StatefulWidget {
  const ObesityEvaluationScreen({super.key});

  @override
  State<ObesityEvaluationScreen> createState() =>
      _ObesityEvaluationScreenState();
}

class _ObesityEvaluationScreenState extends State<ObesityEvaluationScreen> {
  // patient information
  var patientInfomationController = Get.find<PatientStateController>();

  // seletedState
  List<String> selectedState = [];

  List<CheckListDataModel> starState = ObesityCondition.starCondition;

  // obesity evaluation state
  var obisityEvaluationController = Get.put(ObesityEvalStateController());

  // Cardiovascular system
  var cardiovascularSystemController =
      Get.put(CardiovascularSystemController());

  // Respiratory system
  var respiratorySystemController = Get.put(RespiratorySystemController());

  // Other abnormal conditions
  var otherAbnormalController = Get.put(OtherAbnormalConditionController());
  // STOP BANG score
  var stopBangScoreController = Get.put(StopBANGScoreController());

  @override
  void initState() {
    super.initState();

    // auto check in STOP BANG Condition
    if (patientInfomationController.state!.bMI > 35) {
      stopBangScoreController.state[4].check = true;
    }
    if (patientInfomationController.state!.age > 50) {
      stopBangScoreController.state[5].check = true;
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
                GetBuilder<CardiovascularSystemController>(
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
                                // setState(() {
                                //   e.check = value!;
                                //   // update selected state
                                //   updateSelectedState(value, e.title);
                                // });
                              }),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<RespiratorySystemController>(
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
                                // setState(() {
                                //   e.check = value!;
                                //   // update selected state
                                //   updateSelectedState(value, e.title);
                                // });
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
                                      // setState(() {
                                      //   e.check = value!;
                                      //   // update score
                                      //   riskOSAUpdate();
                                      // });
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
                GetBuilder<OtherAbnormalConditionController>(
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
                                // setState(() {
                                //   e.check = value!;
                                //   // update selected state
                                //   updateSelectedState(value, e.title);
                                // });
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
                    Get.to(() => ConsultScreen(
                          title: result.consult,
                          labs: result.labs,
                        ));
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
        cardiovascularSystem: cardiovascularSystemController.state,
        respiratorySystem: respiratorySystemController.state,
        stopBANGCondition: stopBangScoreController.state,
        otherAbnormalConditions: otherAbnormalController.state,
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
    if (patientInfomationController.state!.bMI > 50 ||
        (patientInfomationController.state!.age > 50 &&
            patientInfomationController.state!.bMI >= 40) ||
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

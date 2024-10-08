// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/app_state_controller.dart';
import 'package:preoperative_patient_assessment/models/adult_evaluation_model.dart';
import 'package:preoperative_patient_assessment/controllers/adult_evaluation_state.dart';
import 'package:preoperative_patient_assessment/screens/adult_evaluation/constant_condition.dart';
import 'package:preoperative_patient_assessment/screens/consult_screen/consult_screen.dart';
import 'package:preoperative_patient_assessment/screens/widgets/condition_card.dart';
import 'package:preoperative_patient_assessment/screens/widgets/next_button.dart';
import 'package:preoperative_patient_assessment/utilities/common_function.dart';
import '../../utilities/result_estimate_model.dart';
import '../../widgets/card_selection_widget.dart';

class AdultEvaluationScreen extends StatefulWidget {
  const AdultEvaluationScreen({super.key});

  @override
  State<AdultEvaluationScreen> createState() => _AdultEvaluationScreenState();
}

class _AdultEvaluationScreenState extends State<AdultEvaluationScreen> {
  // patient information
  var patientStateController = Get.find<PatientStateController>();

  List<String> selectedState = [];
  List<String> starState = AdultCondition.starCondition;

  // pediatrics evaluation state
  var adultEvaluationController = Get.put(AdultEvalStateController());

  // Cardiovascular system
  var cardiovascularSystemController =
      Get.put(CardiovascularSystemController());
  // Respiratory system
  var respiratorySystemController = Get.put(RespiratorySystemController());
  // Neurologic system
  var neurologicSystemController = Get.put(NeurologicSystemController());
  // Renal system
  var renalSystemController = Get.put(RenalSystemController());
  // Endocrine system
  var endocrineSystemController = Get.put(EndocrineSystemController());
  // Hematologic system
  var hemotologicSystemController = Get.put(HematologicSystemController());
  // Hepatobility system
  var hepatobilitySystemController = Get.put(HepatobiliaryController());
  // Other system
  var othersSystemController = Get.put(OtherSystemController());
  // Medication
  var medicationController = Get.put(MedicationController());

  // High risk procedure
  var highRiskProcedureController = Get.put(HighriskProcedureController());
  // One-day surgery
  var oneDaySurgeryController = Get.put(OneDaySurgeryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adult Evaluation'),
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
                    title: 'Cardiovascular system',
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
                              }),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<NeurologicSystemController>(
                  init: neurologicSystemController,
                  builder: (controller) => ConditionCard(
                    title: 'Neurologic System',
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
                GetBuilder<RenalSystemController>(
                  init: renalSystemController,
                  builder: (controller) => ConditionCard(
                    title: 'Renal System',
                    conditions: controller.state
                        .map(
                          (e) => CardSelectionWidget(
                            value: e.check,
                            title: e.title,
                            onChanged: (value) {
                              controller.change(e.title, value);
                              updateSelectedState(value!, e.title);
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<EndocrineSystemController>(
                  init: endocrineSystemController,
                  builder: (controller) => ConditionCard(
                    title: 'Endocrine System',
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
                GetBuilder<HematologicSystemController>(
                  init: hemotologicSystemController,
                  builder: (controller) => ConditionCard(
                    title: 'Hematologic System',
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
                GetBuilder<HepatobiliaryController>(
                  init: hepatobilitySystemController,
                  builder: (controller) => ConditionCard(
                    title: 'Hepatobiliary',
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
                GetBuilder<OtherSystemController>(
                  init: othersSystemController,
                  builder: (controller) => ConditionCard(
                    title: 'Other System',
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
                GetBuilder<MedicationController>(
                  init: medicationController,
                  builder: (controller) => ConditionCard(
                    title: 'Medication',
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
                GetBuilder<HighriskProcedureController>(
                  init: highRiskProcedureController,
                  builder: (controller) => ConditionCard(
                    title: 'High risk procedure',
                    conditions: [
                      CardSelectionWidget(
                          value: controller.state ?? false,
                          title: "Yes",
                          onChanged: (_) {
                            controller.set(true);
                          }),
                      CardSelectionWidget(
                          value: controller.state == null
                              ? false
                              : !controller.state!,
                          title: "No",
                          onChanged: (_) {
                            controller.set(false);
                          }),
                    ],
                    child: displayHighRisk(),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<OneDaySurgeryController>(
                  init: oneDaySurgeryController,
                  builder: (controller) => ConditionCard(
                    title: 'One day surgery',
                    conditions: [
                      CardSelectionWidget(
                          value: controller.state ?? false,
                          title: "Yes",
                          onChanged: (_) {
                            controller.set(true);
                          }),
                      CardSelectionWidget(
                          value: controller.state == null
                              ? false
                              : !controller.state!,
                          title: "No",
                          onChanged: (_) {
                            controller.set(false);
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                NextButton(
                  onPressed: () {
                    var result = evaluation();
                    // update evaluation state
                    updateEvaluationState(result);
                    // set evaluation state
                    patientStateController
                        .setAdultEval(adultEvaluationController.state!);
                    Get.to(
                      () => ConsultScreen(
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

  // method
  displayHighRisk() {
    if (highRiskProcedureController.state == null ||
        highRiskProcedureController.state!) {
      return const ExampleHighRisk();
    } else {
      return null;
    }
  }

  updateEvaluationState(ResultEst result) {
    // Test No. 31
    adultEvaluationController.setState(
      AdultEvaluation(
        cardiovascularSystem: cardiovascularSystemController.copy(),
        respiratorySystem: respiratorySystemController.copy(),
        neurologicSystem: neurologicSystemController.copy(),
        renalSystem: renalSystemController.copy(),
        endocrineSystem: endocrineSystemController.copy(),
        hematologicSystem: hemotologicSystemController.copy(),
        hepatobiliarySystem: hepatobilitySystemController.copy(),
        othersSystem: othersSystemController.copy(),
        medication: medicationController.copy(),
        highriskProcedure: highRiskProcedureController.copy(),
        onedaySurgery: oneDaySurgeryController.copy(),
        consult: result.consult,
        labs: result.labs,
      ),
    );
  }

  ResultEst evaluation() {
    String consult = '';
    List<String> labs = [];

    // consult estimate
    if (selectedState.isEmpty) {
      if (highRiskProcedureController.getState == true ||
          oneDaySurgeryController.getState == true) {
        // Test No. 13.1 [OK]
        consult = 'SPAC';
      } else {
        // Test No. 13 [OK]
        consult = 'No further consultation';
      }
    } else {
      if (selectedState.any(
        (element) => starState.contains(element),
      )) {
        // Test No. 11 [OK]
        consult = 'SPAC';
      } else {
        // Test No. 12 [OK]
        consult = 'MED';
      }
    }
    // Test No. 14 [OK]
    // labs estimation
    List<String> everyOneLabs = ['CBC/Platelet count', 'CXR'];
    // add everyone labs much have
    labs += everyOneLabs;

    // Check
    // high risk procedure : Test No. 15 [OK],
    // suspected/diagnotic cancer : Test No. 16 [OK]
    // Hepatobiliary system : Test No. 17 [OK]
    // Hematologic system : Test No. 18 [OK]
    // On anticogulant : Test  No. 19 [OK]
    if (highRiskProcedureController.state == true ||
        selectedState.contains('Suspected/Diagnotic Cancer') ||
        isSelectedIn(
          selected: selectedState,
          list: hepatobilitySystemController.state,
        ) ||
        isSelectedIn(
          selected: selectedState,
          list: hemotologicSystemController.state,
        ) ||
        selectedState.contains('On Anticoagulant')) {
      // update labs
      labs += ['PT/INR', 'PTT'];
    }

    // Check
    // High risk procedure : Test No. 15 [OK]
    // Hepatobilirary System : Test No. 17 [OK]
    // Renal System : Test No. 20 [OK]
    // Endocrine System : Test No. 21 [OK]
    // Neurologic System : Test No. 22 [OK]
    // On diuretics : Test No. 23 [OK]
    // On digoxin : Test No. 24 [OK]
    // On steroid
    // On antipsychotic : Test No. 26 [OK]
    if (highRiskProcedureController.state == true ||
        isSelectedIn(
          selected: selectedState,
          list: hepatobilitySystemController.state,
        ) ||
        isSelectedIn(
          selected: selectedState,
          list: renalSystemController.state,
        ) ||
        isSelectedIn(
          selected: selectedState,
          list: endocrineSystemController.state,
        ) ||
        isSelectedIn(
          selected: selectedState,
          list: neurologicSystemController.state,
        ) ||
        selectedState.contains('On Diuretic') ||
        selectedState.contains('On Digoxin') ||
        selectedState.contains('On Steroid') ||
        selectedState.contains('On Antipsychotic')) {
      // update labs
      labs += ['Electrolytes'];
    }

    // check
    // age >= 65 : Test No. 28 [OK]
    // high risk procedure : Test No. 15 [OK]
    // hepatobiliary system : Test No. 17 [OK]
    // renal system : Test No. 20 [OK]
    // endocrine system : Test No. 21 [OK]
    // neurologic system : Test No. 22 [OK]
    // on diuretics : Test No. 23 [OK]
    // on digoxin : Test No. 24 [OK]
    // on antipsychotic : Test No. 26 [OK]
    if (patientStateController.state!.age >= 65 ||
        highRiskProcedureController.state == true ||
        isSelectedIn(
          selected: selectedState,
          list: hepatobilitySystemController.state,
        ) ||
        isSelectedIn(
          selected: selectedState,
          list: renalSystemController.state,
        ) ||
        isSelectedIn(
          selected: selectedState,
          list: endocrineSystemController.state,
        ) ||
        isSelectedIn(
          selected: selectedState,
          list: neurologicSystemController.state,
        ) ||
        selectedState.contains('On Diuretic') ||
        selectedState.contains('On Digoxin') ||
        selectedState.contains('On Antipsychotic')) {
      labs += ['BUN/Cr'];
    }

    // check
    // age >= 65 : Test No. 28 [OK]
    // high risk procedure : Test No. 15 [OK]
    // Endocrine system : Tes No. 21 [OK]
    // On steroid
    if (patientStateController.state!.age >= 65 ||
        highRiskProcedureController.state == true ||
        isSelectedIn(
          selected: selectedState,
          list: endocrineSystemController.state,
        ) ||
        selectedState.contains('On Steroid')) {
      labs += ['Blood sugar'];
    }

    // check
    // hepatobiliary system : Test No. 17 [OK]
    if (isSelectedIn(
      selected: selectedState,
      list: hepatobilitySystemController.state,
    )) {
      labs += ['LFT'];
    }

    // check
    // age >= 45 : Test No. 27 [OK]
    // high risk procedure : Test No. 15 [OK]
    // Cardiovascular system : Test No. 29 [OK]
    // respiratory system : Test No. 30 [OK]
    // suspected/dianostic cancer : Test No. 16 [OK]
    // endocrine system : Test No. 21 [OK]
    // On digoxin : Test No. 24 [OK]
    if (patientStateController.state!.age >= 45 ||
        highRiskProcedureController.state == true ||
        isSelectedIn(
          selected: selectedState,
          list: cardiovascularSystemController.state,
        ) ||
        isSelectedIn(
          selected: selectedState,
          list: respiratorySystemController.state,
        ) ||
        selectedState.contains('Suspected/Diagnotic Cancer') ||
        isSelectedIn(
          selected: selectedState,
          list: endocrineSystemController.state,
        ) ||
        selectedState.contains('On Digoxin')) {
      labs += ['EKG'];
    }
    return ResultEst(consult: consult, labs: labs);
  }
}

class ExampleHighRisk extends StatelessWidget {
  const ExampleHighRisk({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Example',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('\t - Hightly invasive procedure'),
            Text(
                '\t - Procedure associated with significant changes in the patient\'s physiology or hemodynamics'),
            Text('\t - Anticipate blook loss greater than 1500 cc'),
            Text('\t - For example'),
            Text('\t   major/complex orthopedic-spinal reconstruction'),
            Text(
                '\t   Major reconstructon of GI tract (duodenal-pancreatic, liver resection, bile duct surgery, repair of perforated bowel),'),
            Text('\t   aortic-major vascular surgery'),
            Text('\t   carotid surgery'),
            Text('\t   major genitourinary surgery'),
            Text('\t   major intracranial surgery'),
            Text('\t   pulmonary/liver transplant'),
            Text('\t   radical cystectomy'),
            Text('\t   head and neck cencer surgery with flap reconstruction'),
            Text('\t   total maxillectomy'),
            Text('\t   mandibulectomy with reconstruction'),
          ],
        ),
      ),
    );
  }
}

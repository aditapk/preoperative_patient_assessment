import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/app_state_controller.dart';
import 'package:preoperative_patient_assessment/models/patient_information_model.dart';
import 'package:preoperative_patient_assessment/controllers/pediatric_evaluation_state.dart';
import 'package:preoperative_patient_assessment/screens/summary_registeration_screen.dart';
import 'package:preoperative_patient_assessment/services/patient_firestore_service.dart';

import '../../widgets/custom_header_widget.dart';
// ignore: library_prefixes
import '../../controllers/adult_evaluation_state.dart';
// ignore: library_prefixes
import '../../controllers/obesity_evaluation_state.dart';

class ConsultScreen extends StatelessWidget {
  const ConsultScreen({
    super.key,
    required this.title,
    this.detail,
    this.labs,
    this.fontSize,
  });
  final String title;
  final String? detail;
  final List<String>? labs;
  final double? fontSize;

  // ignore: non_constant_identifier_names
  clear_pediatrics_state() {
    Get.find<PatientStateController>().clear();
    Get.find<PedEvalStateController>().clear();
    Get.find<CVSConditionController>().clear();
    Get.find<RSCondictionController>().clear();
    Get.find<CNSConditionController>().clear();
    Get.find<EndocrineConditionController>().clear();
    Get.find<HematoConditionController>().clear();
    Get.find<OtherConditionController>().clear();
  }

  // ignore: non_constant_identifier_names
  clear_adult_state() {
    Get.find<PatientStateController>().clear();
    // pediatrics evaluation state
    Get.find<AdultEvalStateController>().clear();
    // Cardiovascular system
    Get.find<CardiovascularSystemController>().clear();
    // Respiratory system
    Get.find<RespiratorySystemController>().clear();
    // Neurologic system
    Get.find<NeurologicSystemController>().clear();
    // Renal system
    Get.find<RenalSystemController>().clear();
    // Endocrine system
    Get.find<EndocrineSystemController>().clear();
    // Hematologic system
    Get.find<HematologicSystemController>().clear();
    // Hepatobility system
    Get.find<HepatobiliaryController>().clear();
    // Other system
    Get.find<OtherSystemController>().clear();
    // Medication
    Get.find<MedicationController>().clear();
    // High risk procedure
    Get.find<HighriskProcedureController>().clear();
    // One-day surgery
    Get.find<OneDaySurgeryController>().clear();
  }

  // ignore: non_constant_identifier_names
  clear_obesity_state() {
    // obesity evaluation state
    Get.find<ObesityEvalStateController>().clear();

    // Cardiovascular system
    Get.find<ObesityCardiovascularSystemController>().clear();

    // Respiratory system
    Get.find<ObesityRespiratorySystemController>().clear();

    // Other abnormal conditions
    Get.find<ObesityOtherAbnormalConditionController>().clear();
    // STOP BANG score
    Get.find<StopBANGScoreController>().clear();
  }

  @override
  Widget build(BuildContext context) {
    //var controller = Get.find<ObesityEvalStateController>();
    //print(controller.state);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // todo : Finish action, RECORD data
              var patientRegisterController =
                  Get.find<PatientRegisterStateController>();
              var patientController = Get.find<PatientStateController>();
              // on app
              patientRegisterController.append(patientController.state!);
              // to firestore database
              PatientFirestoreService().post(patientController.state!).then(
                (value) {
                  // append id for patients on app
                  patientRegisterController.updateId(value);
                },
              );
              Get.offAll(() => const SummaryRegisterationScreen());

              // clear state
              if (patientController.state!.formType == FormType.pediatrics) {
                clear_pediatrics_state();
              } else if (patientController.state!.formType == FormType.adult) {
                clear_adult_state();
              } else {
                clear_obesity_state();
              }
              // clear
            },
            child: const Text(
              'Finish',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: CustomHeaderWidget(
              leading: Icons.double_arrow,
              title: 'Consult',
              expandRate: 0.8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 4)),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize ?? 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                if (detail != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        detail!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                if (labs != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height: 50,
                          child: const Text(
                            'LAB TEST',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Column(
                          children: labs!.map(
                            (e) {
                              int index = labs!.indexOf(e);
                              return Container(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  top: 10,
                                  bottom: 10,
                                  right: 20,
                                ),
                                color: index % 2 == 0
                                    ? Colors.grey.shade300
                                    : Colors.grey.shade100,
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No Lab",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

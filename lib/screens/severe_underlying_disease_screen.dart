import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/dialogs/confirmation_text_dialog.dart';
import 'package:preoperative_patient_assessment/dialogs/summary_consult_dialog.dart';
import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';
import 'package:preoperative_patient_assessment/screens/registration_screen.dart';
import 'package:preoperative_patient_assessment/widgets/card_selection_widget.dart';

class SevereUnderlyingDiseaseScreen extends StatefulWidget {
  const SevereUnderlyingDiseaseScreen({super.key});

  @override
  State<SevereUnderlyingDiseaseScreen> createState() =>
      _SevereUnderlyingDiseaseScreenState();
}

class _SevereUnderlyingDiseaseScreenState
    extends State<SevereUnderlyingDiseaseScreen> {
  List<CheckListDataModel> underlyingDiseaseList = [
    CheckListDataModel(
        title: 'Uncontrolled hypertension with asymptomatic (>180/110)',
        check: false),
    CheckListDataModel(title: 'Valvular heart disease', check: false),
    CheckListDataModel(
        title:
            'Cardiac arrhythmia\n \u2022 New-onset AF with anticoagulant\n \u2022 Sicksinus syndrome\n \u2022 Brugada syndrome\n \u2022 On Permanent Pacemaker or Defibrillator',
        check: false),
    CheckListDataModel(
        title:
            'Coronary heart disease with or without intervention (Balloon, Stent, CABG)',
        check: false),
    CheckListDataModel(
        title:
            'EKG suspected coronary heart disease eg. new ST-T change, new LBBB/fasicular block, bigeminy PVC, symptomatic second degree AV block, third-degree AV block',
        check: false),
    CheckListDataModel(
        title: 'Any diagnosis of cardiomyopathy with loss follow up 3 mo',
        check: false),
    CheckListDataModel(
        title:
            'Pulmonary Emboilsm with anticoagulant, chronic pulmonary embolism',
        check: false),
    CheckListDataModel(
        title: 'History of Heart failure - recent 3 mo/ symptomatic CHF',
        check: false),
    CheckListDataModel(
        title: 'Poor-controlled asthma (e.g. asthmatic attack within 1 month)',
        check: false),
    CheckListDataModel(
        title: 'COPD with a history of exacerbation within 1 month',
        check: false),
    CheckListDataModel(title: 'Severe pulmonary fibrosis', check: false),
    CheckListDataModel(
        title:
            'Abnormal CXR e.g., suspect TB lung, pneumonia, unknown cause pleural effusion',
        check: false),
    CheckListDataModel(
        title: 'History o Ischemic stroke within 3 months', check: false),
    CheckListDataModel(
        title: 'Multiple sclerosis Active/ Uncontrolled Autoimmune disease',
        check: false),
  ];

  List<String> selections = [];
  PatientInformationController controller =
      Get.find<PatientInformationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Severe underlying disease'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
        child: Column(
          children: [
            const Text(
              'Does the patient have following underlying disease?',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: underlyingDiseaseList
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(bottom: 2.5),
                            child: CardSelectionWidget(
                                value: e.check,
                                title: e.title,
                                onChanged: (value) {
                                  setState(() {
                                    e.check = value!;
                                  });
                                  print(
                                      "title : ${e.title}, state : ${e.check}");
                                  if (value!) {
                                    selections.add(e.title);
                                  } else {
                                    selections.remove(e.title);
                                  }

                                  print(selections);
                                }),
                          ))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
                onPressed: () async {
                  var result = await Get.dialog(
                    ConfirmationTextDialog(
                      content: const Text(
                        'Are you sure to finish this form?',
                        style: TextStyle(fontSize: 18),
                      ),
                      onOK: () {
                        Get.back(result: true);
                      },
                      onCancel: () {
                        Get.back(result: false);
                      },
                    ),
                  );
                  if (result) {
                    // update summary
                    controller.criteriaForPreOperativeConsultation.summary =
                        'Consult SPAC';

                    if (selections.isEmpty) {
                      Get.dialog(SummaryConsultDialog(
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check,
                              color: Theme.of(Get.context!).primaryColor,
                              size: 100,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Consult SPAC',
                              style: TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                        onOK: () {
                          // update criteria for pre-operative
                          controller.addCriteriaForPreOperativeConsultation();

                          // Go to Registration screen
                          Get.to(() => const RegistrationScreen());
                        },
                      ));
                    } else {
                      // set severe underlying disease
                      controller.criteriaForPreOperativeConsultation
                          .severeUnderlyingDisease = selections;

                      Get.dialog(SummaryConsultDialog(
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check,
                              color: Theme.of(Get.context!).primaryColor,
                              size: 100,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Consult MED',
                              style: TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                        onOK: () {
                          // set consult MED
                          controller.criteriaForPreOperativeConsultation
                              .summary = 'Consult MED';

                          // update criteria for pre-operative consultation
                          controller.addCriteriaForPreOperativeConsultation();

                          // Go to Registration screen
                          Get.to(() => const RegistrationScreen());
                        },
                      ));
                    }
                  }
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

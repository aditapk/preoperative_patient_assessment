import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/dialogs/confirmation_text_dialog.dart';
import 'package:preoperative_patient_assessment/dialogs/summary_consult_dialog.dart';
import 'package:preoperative_patient_assessment/screens/registration_screen.dart';

import 'severe_underlying_disease_screen.dart';

class UnderlyingDiseaseScreen extends StatefulWidget {
  const UnderlyingDiseaseScreen({super.key});

  @override
  State<UnderlyingDiseaseScreen> createState() =>
      _UnderlyingDiseaseScreenState();
}

class _UnderlyingDiseaseScreenState extends State<UnderlyingDiseaseScreen> {
  bool? confirmState;
  PatientInformationController controller =
      Get.find<PatientInformationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Underlying disease'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Does the patient have any underlying disease?',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: confirmState == true
                              ? RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 3.0),
                                )
                              : RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          // selected yes
                          setState(() {
                            confirmState = true;
                          });
                        },
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: confirmState == false
                              ? RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 3.0),
                                )
                              : RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          // selected No
                          setState(() {
                            confirmState = false;
                          });
                        },
                        child: const Text(
                          'No',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                  // Go to Major Operation Screen
                  if (confirmState == true) {
                    // set confirm state
                    controller.criteriaForPreOperativeConsultation
                        .underlyingDisease = 'Yes';

                    Get.to(() => const SevereUnderlyingDiseaseScreen());
                  } else if (confirmState == false) {
                    controller.criteriaForPreOperativeConsultation
                        .underlyingDisease = 'No';

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
                          'Preoperative by surgeon';

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
                              'Preoperative by surgeon',
                              style: TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                        onOK: () {
                          // update criteria for pre-operative consultation
                          controller.addCriteriaForPreOperativeConsultation();

                          // Go to Registration screen
                          Get.to(() => const RegistrationScreen());
                        },
                      ));
                    }
                  }
                  // do nothings
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

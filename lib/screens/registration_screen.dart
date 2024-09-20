import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/main.dart';
import 'package:preoperative_patient_assessment/screens/cardiovascular_screen.dart';
import 'package:preoperative_patient_assessment/screens/comorbidity_screen.dart';
import 'package:preoperative_patient_assessment/screens/summary_registeration_screen.dart';
import 'package:preoperative_patient_assessment/screens/type_of_surgery.dart';

import 'risk_for_operation_bleeding_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationNo1ScreenState();
}

class _RegistrationNo1ScreenState extends State<RegistrationScreen> {
  // Patient information
  PatientInformationController patientInformationController =
      Get.find<PatientInformationController>();
  @override
  void initState() {
    super.initState();
    registerationIndex =
        patientInformationController.patientSurgeryInfos.length + 1;

    // test display criteria for pre-operative
    patientInformationController
        .currentPatientSurgeryInfo?.criteriaForPreOperativeConsultation
        .forEach((element) {
      print(element);
    });
  }

  late int registerationIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Registration no. $registerationIndex',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: HeaderWidget(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView(
                children: [
                  const Text(
                    'Choose form below to continue',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (patientInformationController
                              .currentPatientSurgeryInfo!.patientInfo!.age <
                          15) {
                        // Age < 15 years old
                        Get.to(() => const RiskforOperationBleedingScreen());
                      } else {
                        // Age >= 15 years old
                        Get.to(() => const ComobidityScreen());
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      height: 60,
                      width: double.infinity,
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Laboratory Investigation',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_right)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // for test
                      // Get.defaultDialog(
                      //     title: 'Not support for now',
                      //     middleText: 'developer is implementing',
                      //     actions: [
                      //       TextButton(
                      //         child: const Text('OK'),
                      //         onPressed: () {
                      //           Get.back();
                      //         },
                      //       )
                      //     ]);
                      // Get.to(() => const CardioVascularScreen());
                      if (patientInformationController
                              .currentPatientSurgeryInfo!.patientInfo!.age <
                          15) {
                        Get.to(() => const CardioVascularScreen());
                      } else if (patientInformationController
                              .currentPatientSurgeryInfo!.patientInfo!.age >=
                          15) {
                        // Go to Type of surgery
                        Get.to(() => const TypeOfSurgeryScreen());
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      height: 80,
                      width: double.infinity,
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Criteria for preoperative pediatric consultation',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_right)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                          title: 'Not support for now',
                          middleText: 'developer is implementing',
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Get.back();
                              },
                            )
                          ]);
                      // Get.to(() => const CardioVascularScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      height: 80,
                      width: double.infinity,
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Preoperative assessment of the obesity patient',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_right)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                          title: 'Not support for now',
                          middleText: 'developer is implementing',
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Get.back();
                              },
                            )
                          ]);
                      // Get.to(() => const CardioVascularScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      height: 80,
                      width: double.infinity,
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Preoperative assessment of the geriatric patient',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_right)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        animatedIcon: AnimatedIcons.menu_close,
        renderOverlay: false,
        spacing: 5,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.check),
              label: 'Finish',
              onTap: () {
                // add current info to group info
                patientInformationController.updatePatientSurgeryInfo();

                //patientInformationController.addCurrenttoInfo();
                Get.off(() => const SummaryRegisterationScreen());
              }),
          SpeedDialChild(
              child: const Icon(
                Icons.help,
              ),
              label: 'Help'),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    super.key,
  });

  final PatientInformationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      alignment: Alignment.center,
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        children: [
          const SizedBox(
            width: 40,
          ),
          Icon(
            //false
            controller.currentPatientSurgeryInfo!.patientInfo!.age < 15
                ? Icons.child_care
                : Icons.person,
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            controller.currentPatientSurgeryInfo!.patientInfo!.age < 15
                ? "Pediatrics ( < 15 years)"
                : "Adult ( \u2265 15 years )",
            style: const TextStyle(
                letterSpacing: 0.8,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:preoperative_patient_assessment/constant.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';

import '../screens/registration_screen.dart';

class ConfirmationDialog extends StatefulWidget {
  const ConfirmationDialog({super.key});

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  final TextStyle contentTextStyle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  PatientInformationController patientInformationController =
      Get.find<PatientInformationController>();
  // final PatientInformation patientInformation = PatientInformation(
  //     gender: Gender.male,
  //     age: 12,
  //     bodyWeight: 40,
  //     height: 170,
  //     bMI: 22.75,
  //     diagnosis: 'Some Diagnosis',
  //     operation: 'Some Operation',
  //     dateOfOperation: DateFormat('dd/MM/yyy').parse('05/04/2024'));
  final String dateformat = 'dd/MM/yyyy';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),

                      // Confirm header
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 40,
                            ),
                            Icon(
                              Icons.double_arrow,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Confirmation',
                              style: TextStyle(
                                  letterSpacing: 0.8,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight -
                            70, //MediaQuery.of(context).size.height * 0.5 - 70,
                        width: constraints.maxWidth,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '\u2022 ${patientInformationController.currentPatientSurgeryInfo?.patientInfo?.age} years old',
                                  style: contentTextStyle,
                                ),
                                Text(
                                  '\u2022 ${patientInformationController.currentPatientSurgeryInfo?.patientInfo?.gender == Gender.male ? "Male" : "Female"}',
                                  style: contentTextStyle,
                                ),
                                Text(
                                  '\u2022 ${patientInformationController.currentPatientSurgeryInfo?.patientInfo?.bodyWeight} kg.',
                                  style: contentTextStyle,
                                ),
                                Text(
                                  '\u2022 ${patientInformationController.currentPatientSurgeryInfo?.patientInfo?.height} cm.',
                                  style: contentTextStyle,
                                ),
                                Text(
                                  '\u2022 BMI = ${patientInformationController.currentPatientSurgeryInfo?.patientInfo?.bMI}',
                                  style: contentTextStyle,
                                ),
                                Text(
                                  '\u2022 ${patientInformationController.currentPatientSurgeryInfo?.patientInfo?.diagnosis}',
                                  style: contentTextStyle,
                                ),
                                Text(
                                  '\u2022 ${patientInformationController.currentPatientSurgeryInfo?.patientInfo?.operation}',
                                  style: contentTextStyle,
                                ),
                                Text(
                                  '\u2022 Date : ${DateFormat(dateformat).format(patientInformationController.currentPatientSurgeryInfo!.patientInfo!.dateOfOperation)}',
                                  style: contentTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Content
                    ],
                  ),
                );
              },
            ),
          ),
          actions: [
            SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey.shade700),
                onPressed: () {
                  Get.back();
                },
                child: const Text('Cancel'),
              ),
            ),
            SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Get.offAll(() => const RegistrationScreen());
                },
                child: const Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }
}

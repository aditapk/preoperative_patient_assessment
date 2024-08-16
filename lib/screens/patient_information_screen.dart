import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:preoperative_patient_assessment/constant.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/models/patient_information_model.dart';
import 'package:preoperative_patient_assessment/models/patient_sugery_infomation.dart';
import 'package:preoperative_patient_assessment/screens/registry_information_screen.dart';

import 'widgets/custom_text_field.dart';
import 'widgets/text_divider.dart';

class PatientInformationScreen extends StatefulWidget {
  const PatientInformationScreen({super.key});

  @override
  State<PatientInformationScreen> createState() =>
      _PatientInformationScreenState();
}

class _PatientInformationScreenState extends State<PatientInformationScreen> {
  PatientInformationController patientInformationController =
      Get.find<PatientInformationController>();
  Gender selectedGender = Gender.male;
  TextEditingController ageController = TextEditingController();

  // ---- Body ---- //
  TextEditingController bodyweightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController bmiController = TextEditingController();

  // ---- Operation ---- //
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController operationController = TextEditingController();
  TextEditingController dateOperationController = TextEditingController();

  // -- error text --//
  String? ageErrorText;
  String? bodyWeightErrorText;
  String? heightErrorText;
  String? bmiErrorText;
  String? diagnosisErrorText;
  String? operationErrorText;
  String? dateOperationErrorText;

  // -- next -- //
  bool allowErrorChecking = false;

  final String dateformat = 'dd/MM/yyyy';

  String? checkErrorText({required String text, bool? checkNumber}) {
    if (text.isEmpty) {
      return 'required';
    }
    if (checkNumber != null) {
      if (checkNumber) {
        var number = double.tryParse(text);
        if (number == null) {
          return 'Must be a number';
        }
      }
    }
    return null;
  }

  final double heightSpace = 15;
  setBMI() {
    double? bodyWeight = double.tryParse(bodyweightController.text);
    var height = double.tryParse(heightController.text);
    if (bodyWeight != null && height != null) {
      // BMI
      var mHeight = height / 100;
      var bmi = bodyWeight / (mHeight * mHeight);
      bmiController.text = bmi.toStringAsFixed(2);
    } else {
      bmiController.text = "";
    }
  }

  // date pickup
  pickUpOperationDate() async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
            data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
              primary: Color(0xFF017769),
            )),
            child: child!);
      },
    );
    if (date != null) {
      setState(() {
        dateOperationController.text = DateFormat(dateformat).format(date);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // create patient surgery information
    patientInformationController.currentPatientSurgeryInfo =
        PatientSurgeryInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patient Information',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            // -- Gender ---//
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: RadioListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title: Text(
                      'Male',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: selectedGender == Gender.male
                              ? FontWeight.bold
                              : null,
                          color: selectedGender == Gender.male
                              ? Theme.of(context).primaryColor
                              : null),
                    ),
                    value: Gender.male,
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: RadioListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title: Text('Female',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: selectedGender == Gender.female
                                ? FontWeight.bold
                                : null,
                            color: selectedGender == Gender.female
                                ? Theme.of(context).primaryColor
                                : null)),
                    value: Gender.female,
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heightSpace,
            ),
            // -- Age -- //
            CustomTextField(
              label: "Age",
              controller: ageController,
              errorText: allowErrorChecking
                  ? checkErrorText(
                      text: ageController.text,
                      checkNumber: true,
                    )
                  : null,
              onChanged: (value) {
                setState(() => checkErrorText(
                      text: value,
                      checkNumber: true,
                    ));
              },
            ),
            SizedBox(
              height: heightSpace,
            ),
            // Divider : Body
            const TextDivider(
              title: 'Body',
            ),
            SizedBox(
              height: heightSpace,
            ),

            CustomTextField(
              label: 'Body weight',
              controller: bodyweightController,
              keyboardType: TextInputType.number,
              errorText: allowErrorChecking
                  ? checkErrorText(
                      text: bodyweightController.text,
                      checkNumber: true,
                    )
                  : null,
              onChanged: (value) {
                setState(() => checkErrorText(
                      text: value,
                      checkNumber: true,
                    ));
                setBMI();
              },
            ),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextField(
              label: 'Height',
              controller: heightController,
              keyboardType: TextInputType.number,
              errorText: allowErrorChecking
                  ? checkErrorText(
                      text: heightController.text,
                      checkNumber: true,
                    )
                  : null,
              onChanged: (value) {
                setState(() => checkErrorText(
                      text: value,
                      checkNumber: true,
                    ));
                setBMI();
              },
            ),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextField(
              label: 'BMI',
              controller: bmiController,
              errorText: allowErrorChecking
                  ? checkErrorText(
                      text: bmiController.text,
                      checkNumber: true,
                    )
                  : null,
              onChanged: (value) {
                setState(() {
                  checkErrorText(
                    text: value,
                    checkNumber: true,
                  );
                });
              },
            ),
            SizedBox(
              height: heightSpace,
            ),
            const TextDivider(
              title: 'Operation',
            ),
            SizedBox(
              height: heightSpace,
            ),
            // -- Diagnosis -- //
            CustomTextField(
              label: "Diagnosis",
              controller: diagnosisController,
              keyboardType: TextInputType.multiline,
              maxLines: 2,
              errorText: allowErrorChecking
                  ? checkErrorText(text: diagnosisController.text)
                  : null,
              onChanged: (value) {
                setState(() {
                  checkErrorText(text: value);
                });
              },
            ),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextField(
              label: 'Operation',
              controller: operationController,
              errorText: allowErrorChecking
                  ? checkErrorText(text: operationController.text)
                  : null,
              onChanged: (value) {
                setState(() {
                  checkErrorText(text: value);
                });
              },
            ),
            SizedBox(
              height: heightSpace,
            ),
            // --
            CustomTextField(
              readOnly: true,
              errorText: allowErrorChecking
                  ? checkErrorText(text: dateOperationController.text)
                  : null,
              onChanged: (value) {
                setState(() {
                  checkErrorText(text: value);
                });
              },
              controller: dateOperationController,
              label: "Date of operation",
              isSuffixIcon: true,
              onSuffix: pickUpOperationDate,
              onTap: pickUpOperationDate,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white),
                onPressed: () {
                  ageErrorText = checkErrorText(
                    text: ageController.text,
                    checkNumber: true,
                  );
                  bodyWeightErrorText = checkErrorText(
                    text: bodyweightController.text,
                    checkNumber: true,
                  );
                  heightErrorText = checkErrorText(
                    text: heightController.text,
                    checkNumber: true,
                  );
                  bmiErrorText = checkErrorText(
                    text: bmiController.text,
                    checkNumber: true,
                  );
                  diagnosisErrorText =
                      checkErrorText(text: diagnosisController.text);
                  operationErrorText =
                      checkErrorText(text: operationController.text);
                  dateOperationErrorText =
                      checkErrorText(text: operationController.text);
                  if ((ageErrorText == null) &&
                      (bodyWeightErrorText == null) &&
                      (heightErrorText == null) &&
                      (bmiErrorText == null) &&
                      (diagnosisErrorText == null) &&
                      (operationErrorText == null) &&
                      (dateOperationErrorText == null)) {
                    var patientInfo = PatientInformation(
                      gender: selectedGender,
                      age: int.parse(ageController.text),
                      bodyWeight: double.parse(bodyweightController.text),
                      height: double.parse(heightController.text),
                      bMI: double.parse(bmiController.text),
                      diagnosis: diagnosisController.text,
                      operation: operationController.text,
                      dateOfOperation: DateFormat(dateformat)
                          .parse(dateOperationController.text),
                    );
                    patientInformationController.setPatientInfo(patientInfo);
                    // go to Registry Information
                    Get.to(() => const RegistryInformationScreen());
                  } else {
                    setState(() {
                      allowErrorChecking = true;
                    });
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.navigate_next,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

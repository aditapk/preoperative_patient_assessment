import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:preoperative_patient_assessment/constant.dart';
import 'package:preoperative_patient_assessment/controllers/app_state_controller.dart';
import 'package:preoperative_patient_assessment/models/patient_information_model.dart';
import 'package:preoperative_patient_assessment/screens/pediatrics_evaluation/pediatrics_evaluation_screen.dart';
import '../../models/physician_information_model.dart';
import '../adult_evaluation/adult_evaluation_screen.dart';
import '../obesity_evaluation/obesity_evaluation_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/text_divider.dart';
import 'agefield_widget.dart';
import 'bodyweightfield_widget.dart';
import 'gender_widget.dart';

class PatientInformationScreen extends StatefulWidget {
  const PatientInformationScreen({
    super.key,
    this.isEdit,
  });

  final bool? isEdit;

  @override
  State<PatientInformationScreen> createState() =>
      _PatientInformationScreenState();
}

class _PatientInformationScreenState extends State<PatientInformationScreen> {
  var patientStateController = Get.find<PatientStateController>();
  var physicientStateController = Get.find<PhysicientStateController>();

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
  String? nameErrorText;
  bool departmentError = false;
  String? phoneNumberErrorText;

  // -- next -- //
  bool allowErrorChecking = false;

  final String dateformat = 'dd/MM/yyyy';

  // physician contact
  TextEditingController physicianNameController = TextEditingController();
  TextEditingController physicianPhoneNumberController =
      TextEditingController();
  String? physicianDepartment;

  @override
  void initState() {
    super.initState();
    // initial current date
    dateOperationController.text =
        DateFormat(dateformat).format(DateTime.now());

    // initial Physician Contact, if exist
    if (physicientStateController.state != null) {
      physicianNameController.text = physicientStateController.state!.name;
      physicianDepartment = physicientStateController.state!.department;
      physicianPhoneNumberController.text =
          physicientStateController.state!.phoneNumber;
    }
    // // todo : test
    // ageController.text = "${14}";
    // bodyweightController.text = "${0.0031}";
    // heightController.text = "${1}";
    // bmiController.text = "${bmiCal(0.0031, 1)}";
    // diagnosisController.text = "diag test";
    // operationController.text = "operation test";

    // physicianNameController.text = "phy test";
    // physicianDepartment = departments[0];
    // physicianPhoneNumberController.text = "00000";

    // editing
    if (widget.isEdit ?? false) {
      selectedGender = patientStateController.gender!;
      ageController.text = patientStateController.age.toString();
      bodyweightController.text = patientStateController.bodyWeight.toString();
      heightController.text = patientStateController.height.toString();
      bmiController.text = patientStateController.bMI.toString();
      diagnosisController.text = patientStateController.diagnosis ?? "";
      operationController.text = patientStateController.operation ?? "";
      dateOperationController.text = DateFormat(dateformat)
          .format(patientStateController.dateOfOperation!);
      // physician
      physicianNameController.text = patientStateController.physician!.name;
      physicianDepartment = patientStateController.physician!.department;
      physicianPhoneNumberController.text =
          patientStateController.physician!.phoneNumber;
    }
  }

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
  bmiCal(double w, double h) {
    double mH = h / 100;
    return w / (mH * mH);
  }

  setBMI() {
    double? bodyWeight = double.tryParse(bodyweightController.text);
    double? height = double.tryParse(heightController.text);
    if (bodyWeight != null && height != null) {
      // BMI
      double bmi = bmiCal(bodyWeight, height);
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

  validate() {
    setState(() {
      ageErrorText = checkErrorText(text: ageController.text);
      bodyWeightErrorText = checkErrorText(text: bodyweightController.text);
      heightErrorText = checkErrorText(text: heightController.text);
      bmiErrorText = checkErrorText(text: bmiController.text);
      diagnosisErrorText = checkErrorText(text: diagnosisController.text);
      dateOperationErrorText =
          checkErrorText(text: dateOperationController.text);
      nameErrorText = checkErrorText(text: physicianNameController.text);
      departmentError = physicianDepartment == null;
      phoneNumberErrorText =
          checkErrorText(text: physicianPhoneNumberController.text);
    });
    bool valid = ageErrorText == null &&
        bodyWeightErrorText == null &&
        heightErrorText == null &&
        bmiErrorText == null &&
        diagnosisErrorText == null &&
        dateOperationErrorText == null &&
        !departmentError &&
        phoneNumberErrorText == null;
    return valid;
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
            GenderWidget(
              value: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
            ),
            SizedBox(
              height: heightSpace,
            ),
            // -- Age -- //
            AgeFieldWidget(
              controller: ageController,
              errorText: ageErrorText,
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
            // Body Weight
            BodyWeightFieldWidget(
              controller: bodyweightController,
              errorText: bodyWeightErrorText,
              onChanged: (value) {
                setBMI();
              },
            ),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextField(
              label: 'Height',
              controller: heightController,
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true), // Numeric keyboard with decimal support
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(
                    r'^\d*\.?\d*')), // Regular expression to allow only numbers and decimal points
              ],
              errorText: heightErrorText,
              onChanged: (value) {
                setBMI();
              },
            ),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextField(
              label: 'BMI',
              readOnly: true,
              controller: bmiController,
              errorText: bmiErrorText,
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
              maxLines: 3,
              errorText: diagnosisErrorText,
            ),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextField(
              label: 'Operation',
              maxLines: 3,
              controller: operationController,
              errorText: operationErrorText,
            ),
            SizedBox(
              height: heightSpace,
            ),
            // --
            CustomTextField(
              readOnly: true,
              errorText: dateOperationErrorText,
              controller: dateOperationController,
              label: "Date of operation",
              isSuffixIcon: true,
              onSuffix: pickUpOperationDate,
              onTap: pickUpOperationDate,
            ),
            const SizedBox(
              height: 15,
            ),
            const TextDivider(
              title: 'Physician Contact',
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              label: 'Name',
              controller: physicianNameController,
              errorText: nameErrorText,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: departmentError
                      ? Colors.red
                      : Colors.black54, // Border color
                  width: 1.0, // Border width
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButton(
                padding: const EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(8),
                isExpanded: true,
                menuMaxHeight: 300,
                hint: Text('Department/Divisions',
                    style: TextStyle(
                        fontSize: 16,
                        color: departmentError ? Colors.red : Colors.black87)),
                value: physicianDepartment,
                items: departments
                    .map(
                      (dep) => DropdownMenuItem(
                        value: dep,
                        child: Text(dep),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    physicianDepartment = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              label: 'Phone Number',
              controller: physicianPhoneNumberController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly // Allows only digits
              ],
              errorText: phoneNumberErrorText,
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
                onPressed: onNext,
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

  onNext() {
    if (validate()) {
      // update patient and physicient information
      if (widget.isEdit ?? false) {
        updateState();
      } else {
        setNewState();
      }

      // selecte proper evaluation page
      selectEvaluationPage();
    }
  }

  updateState() {
    patientStateController.state!.copyWith(
      gender: selectedGender,
      age: int.parse(ageController.text),
      bodyWeight: double.parse(bodyweightController.text),
      height: double.parse(heightController.text),
      bMI: double.parse(bmiController.text),
      diagnosis: diagnosisController.text,
      operation: operationController.text,
      dateOfOperation:
          DateFormat(dateformat).parse(dateOperationController.text),
      physician: Physician(
          name: physicianNameController.text,
          department: physicianDepartment!,
          phoneNumber: physicianPhoneNumberController.text),
    );
  }

  setNewState() {
    // patient state
    patientStateController.setState(
      Patient(
        gender: selectedGender,
        age: int.parse(ageController.text),
        bodyWeight: double.parse(bodyweightController.text),
        height: double.parse(heightController.text),
        bMI: double.parse(bmiController.text),
        diagnosis: diagnosisController.text,
        operation: operationController.text,
        dateOfOperation:
            DateFormat(dateformat).parse(dateOperationController.text),
        physician: Physician(
            name: physicianNameController.text,
            department: physicianDepartment!,
            phoneNumber: physicianPhoneNumberController.text),
      ),
    );
    // physicient state
    physicientStateController.setState(
      Physician(
          name: physicianNameController.text,
          department: physicianDepartment!,
          phoneNumber: physicianPhoneNumberController.text),
    );
  }

  selectEvaluationPage() {
    // int age = int.parse(ageController.text);
    // double bMI = double.parse(bmiController.text);
    if (patientStateController.state!.formType == FormType.pediatrics) {
      // Pediatrics : Test No. 1 [OK]
      Get.to(() => PediatricsEvaluationScreen(
            isEdit: widget.isEdit,
          ));
    } else if (patientStateController.state!.formType == FormType.adult) {
      // Adult : Test No. 2 [OK]
      Get.to(() => const AdultEvaluationScreen());
    } else if (patientStateController.state!.formType == FormType.obesity) {
      // Obesity : Test No. 3 [OK]
      Get.to(() => const ObesityEvaluationScreen());
    }
  }
}

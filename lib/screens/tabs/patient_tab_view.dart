import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:preoperative_patient_assessment/constant.dart';
import 'package:preoperative_patient_assessment/models/patient_information_model.dart';
import 'package:preoperative_patient_assessment/screens/widgets/custom_text_field.dart';
import 'package:preoperative_patient_assessment/screens/widgets/text_divider.dart';

class PatientTabView extends StatefulWidget {
  const PatientTabView({super.key, required this.patientInformation});

  final PatientInformation patientInformation;

  @override
  State<PatientTabView> createState() => _PatientTabViewState();
}

class _PatientTabViewState extends State<PatientTabView> {
  final double heightSpace = 15;
  TextEditingController ageController = TextEditingController();
  TextEditingController bodyWeightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController bMIController = TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController operationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // initial state
    ageController.text = widget.patientInformation.age.toString();
    bodyWeightController.text = widget.patientInformation.bodyWeight.toString();
    heightController.text = widget.patientInformation.height.toString();
    bMIController.text = widget.patientInformation.bMI.toString();
    diagnosisController.text = widget.patientInformation.diagnosis;
    operationController.text = widget.patientInformation.operation;
    dateController.text = DateFormat('dd/MM/yyyy')
        .format(widget.patientInformation.dateOfOperation);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    onChanged: (value) {},
                    title: const Text('Male'),
                    value: Gender.male,
                    groupValue: widget.patientInformation.gender,
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    onChanged: (value) {},
                    title: const Text('Female'),
                    value: Gender.female,
                    groupValue: widget.patientInformation.gender,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextField(
              controller: ageController,
              label: 'Age',
              maxLines: 1,
              readOnly: true,
            ),
            SizedBox(
              height: heightSpace,
            ),
            const TextDivider(title: 'Body'),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextField(
              controller: bodyWeightController,
              label: 'Body weight',
              readOnly: true,
              maxLines: 1,
            ),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextField(
              controller: heightController,
              label: 'Height',
              readOnly: true,
              maxLines: 1,
            ),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextField(
              controller: bMIController,
              label: 'BMI',
              readOnly: true,
              maxLines: 1,
            ),
            SizedBox(
              height: heightSpace,
            ),
            const TextDivider(title: 'Operation'),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextField(
              controller: diagnosisController,
              label: 'Diagnosis',
              readOnly: true,
              maxLines: 1,
            ),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextField(
              controller: operationController,
              label: 'Operation',
              readOnly: true,
              maxLines: 1,
            ),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextField(
              controller: dateController,
              label: 'Date of operation',
              readOnly: true,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

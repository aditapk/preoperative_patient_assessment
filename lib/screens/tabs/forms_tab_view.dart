import 'package:flutter/material.dart';
import 'package:preoperative_patient_assessment/models/criteria_for_preoperative_consultation_model.dart';
import 'package:preoperative_patient_assessment/models/lab_investigration_model.dart';
import 'package:preoperative_patient_assessment/screens/tabs/criteria_for_preoperative_consultation_formview.dart';
import 'package:preoperative_patient_assessment/screens/tabs/lab_investigration_form_view.dart';

class FormsTabView extends StatefulWidget {
  const FormsTabView({
    super.key,
    required this.labInvestigations,
    required this.criteriaForPreOperativeConsultations,
    required this.patientAge,
  });

  final List<LabInvestigration> labInvestigations;
  final List<CriteriaForPreOperativeConsultation>
      criteriaForPreOperativeConsultations;
  final int patientAge;
  @override
  State<FormsTabView> createState() => _FormsTabViewState();
}

class FormData {
  String? name;
  dynamic lab;
  FormData({this.name, this.lab});
}

class _FormsTabViewState extends State<FormsTabView> {
  List<FormData> selectionList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //
    for (var element in widget.labInvestigations) {
      selectionList
          .add(FormData(name: 'Laboratory Investigation', lab: element));
    }
    for (var element in widget.criteriaForPreOperativeConsultations) {
      selectionList.add(FormData(
          name: 'Criteria for preoperative consultation', lab: element));
    }

    labSeleted = selectionList[0];
  }

  late FormData? labSeleted;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DropdownButton<FormData>(
            style: const TextStyle(fontSize: 18),
            borderRadius: BorderRadius.circular(8),
            value: labSeleted,
            isExpanded: true,
            items: selectionList.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item.name ?? 'untitle',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                labSeleted = value;
              });
            },
          ),
          if (labSeleted?.name == 'Laboratory Investigation')
            LabInvestigrationFormView(
              labInvestigration: labSeleted?.lab as LabInvestigration,
              patientAge: widget.patientAge,
            ),
          if (labSeleted?.name == 'Criteria for preoperative consultation')
            CriteriaForPreOperativeConsultationFormView(
              criteriaForPreOperativeConsultation:
                  labSeleted?.lab as CriteriaForPreOperativeConsultation,
              patientAge: widget.patientAge,
            )
        ],
      ),
    );
  }
}

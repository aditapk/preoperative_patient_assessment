import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/models/patient_information_model.dart';
import 'package:preoperative_patient_assessment/screens/tabs/adult_form_display.dart';
import 'package:preoperative_patient_assessment/screens/tabs/obesity_form_display.dart';
import 'package:preoperative_patient_assessment/screens/tabs/pediatrics_form_display.dart';


class FormsTabView extends StatefulWidget {
  const FormsTabView({
    super.key,
    required this.patient,
  });
  final Patient patient;
  @override
  State<FormsTabView> createState() => _FormsTabViewState();
}

class _FormsTabViewState extends State<FormsTabView> {
  List<FormData> selectionList = [];

  @override
  Widget build(BuildContext context) {
    if (widget.patient.formType == FormType.pediatrics) {
      return PediatricsFormDisplay(
        evalState: widget.patient.pediatricsEvaluation!,
      );
    } else if (widget.patient.formType == FormType.adult) {
      return AdultFormDisplay(
        evalState: widget.patient.adultEvaluation!,
      );
    } else {
      return ObesityFormDisplay(
        evalState: widget.patient.obesityEvaluation!,
      );
    }
  }
}

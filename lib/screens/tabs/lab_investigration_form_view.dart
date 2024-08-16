import 'package:flutter/material.dart';
import 'package:preoperative_patient_assessment/models/lab_investigration_model.dart';

import 'widgets/detail_list.dart';
import 'widgets/header.dart';

class LabInvestigrationFormView extends StatefulWidget {
  const LabInvestigrationFormView({
    super.key,
    required this.labInvestigration,
    required this.patientAge,
  });

  final LabInvestigration labInvestigration;
  final int patientAge;

  @override
  State<LabInvestigrationFormView> createState() =>
      _LabInvestigrationFormViewState();
}

class _LabInvestigrationFormViewState extends State<LabInvestigrationFormView> {
  // Mockup data
  // final List<String> comorbidityList = [
  //   'Autoimmune',
  //   'CNS',
  //   'CVS/hypertension'
  // ];
  // final List<String> majorOperationList = ['Prolong ...'];
  // final List<String> specialDrugList = ['Diuretics drug'];
  // final List<String> summaryList = [
  //   'Anti-HIV',
  //   'BUN',
  //   'CBC',
  // ];
  List<String> getSummary() {
    List<String> summaryList = [];
    if (widget.patientAge < 15) {
      summaryList = widget.labInvestigration.getOperativePlanListLess15();
    } else if (widget.patientAge >= 15 && widget.patientAge <= 45) {
      summaryList = widget.labInvestigration.getOperativePlanList15To45();
    } else if (widget.patientAge > 45) {
      summaryList = widget.labInvestigration.getOperativePlanListOver45();
    } else {
      debugPrint('Error : getSummary()');
      return []; // not support
    }
    summaryList.sort((a, b) => a.compareTo(b));
    return summaryList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // for age < 15
        if (widget.patientAge < 15)
          const Header(title: 'Risk for operation bleeding'),
        if (widget.patientAge < 15)
          DetailList(
            detail: widget.labInvestigration.riskForOperationBleeding,
          ),
        if (widget.patientAge < 15)
          const Header(
            title: 'Risk associated condictions',
          ),
        if (widget.patientAge < 15)
          DetailList(detail: widget.labInvestigration.riskAssociatedConditions),

        // for age >= 15
        // Comorbidity Header
        if (widget.patientAge >= 15)
          const Header(
            title: 'Comorbidity',
          ),
        // Comorbidity List
        if (widget.patientAge >= 15)
          DetailList(
            detail: widget.labInvestigration.comorbidity,
          ),
        // Major Operation Header
        if (widget.patientAge >= 15) const Header(title: 'Major Operation'),

        // Major Operation List
        if (widget.patientAge >= 15)
          DetailList(
            detail: widget.labInvestigration.majorOperation,
          ),
        // Special Drug Header
        const Header(
          title: 'Special Drug',
        ),

        // Special Drug List
        DetailList(
          detail: widget.labInvestigration.specialDrug,
        ),
        // Summary Header
        const Header(title: 'Summary'),
        // Summary List
        DetailList(detail: getSummary()),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:preoperative_patient_assessment/models/criteria_for_preoperative_consultation_model.dart';
import 'package:preoperative_patient_assessment/screens/tabs/widgets/detail_list.dart';
import 'package:preoperative_patient_assessment/screens/tabs/widgets/header.dart';
import 'package:preoperative_patient_assessment/screens/type_of_surgery.dart';

class CriteriaForPreOperativeConsultationFormView extends StatefulWidget {
  const CriteriaForPreOperativeConsultationFormView({
    super.key,
    required this.criteriaForPreOperativeConsultation,
    required this.patientAge,
  });

  final CriteriaForPreOperativeConsultation criteriaForPreOperativeConsultation;
  final int patientAge;

  @override
  State<CriteriaForPreOperativeConsultationFormView> createState() =>
      _CriteriaForPreOperativeConsultationFormViewState();
}

class _CriteriaForPreOperativeConsultationFormViewState
    extends State<CriteriaForPreOperativeConsultationFormView> {
  @override
  Widget build(BuildContext context) {
    if (widget.patientAge >= 15) {
      return Column(
        children: [
          // For Age >= 15 years old
          const Header(title: 'Type of surgery'),
          buildTypeOfSurgery(
              widget.criteriaForPreOperativeConsultation.typeOfSurgery!),
          const Header(
            title: 'Revised Cardiac Risk Index: RCRI',
          ),
          buildRevisedCardiacRiskIndex(widget
              .criteriaForPreOperativeConsultation.revisedCardiacRiskIndex),
          const Header(title: 'Functional capacity (METs)'),
          buildFuntionalCapacityMETs(
              widget.criteriaForPreOperativeConsultation.functionalCapacity),
          const Header(
            title: 'Underlying disease',
          ),
          buildUnderlyingDisease(
              widget.criteriaForPreOperativeConsultation.underlyingDisease),
          const Header(title: 'Severe underlying disease'),
          buildSevereUnderlyingDisease(widget
              .criteriaForPreOperativeConsultation.severeUnderlyingDisease),
          const Header(title: 'Summary'),
          buildSummary(widget.criteriaForPreOperativeConsultation.summary!),
        ],
      );
    } else {
      // Age < 15 years old
      return Column(
        children: [
          const Header(title: 'Cardiovascular'),
          buildCardiovascular(
              widget.criteriaForPreOperativeConsultation.cardioVascular),
          const Header(title: 'Respiratory'),
          buildRespiratory(
              widget.criteriaForPreOperativeConsultation.respiratory),
          const Header(title: 'Neurological'),
          buildNeurological(
              widget.criteriaForPreOperativeConsultation.neurological),
          const Header(title: 'Endocrine'),
          buildEndocrine(widget.criteriaForPreOperativeConsultation.endocrine),
          const Header(title: 'Hematologic'),
          buildHematologic(
              widget.criteriaForPreOperativeConsultation.hematologic),
          const Header(title: 'Other'),
          buildOther(widget.criteriaForPreOperativeConsultation.others),
          const Header(title: 'Summary'),
          if (widget.criteriaForPreOperativeConsultation.summary ==
              'Consult PED')
            buildSummaryPED([
              widget.criteriaForPreOperativeConsultation.summary!,
              'ส่งตรวจทางห้องปฏิบัติการตามดุลพินิจของกุมารแพทย์'
            ])
          else
            buildSummary(widget.criteriaForPreOperativeConsultation.summary!),
        ],
      );
    }
  }

// age < 15 years old
  buildCardiovascular(List<String> detail) {
    return DetailList(detail: detail);
  }

  buildRespiratory(List<String> detail) {
    return DetailList(detail: detail);
  }

  buildNeurological(List<String> detail) {
    return DetailList(detail: detail);
  }

  buildEndocrine(List<String> detail) {
    return DetailList(detail: detail);
  }

  buildHematologic(List<String> detail) {
    return DetailList(detail: detail);
  }

  buildOther(List<String> detail) {
    return DetailList(detail: detail);
  }

  // buildSummary() {} // share

  // age >= 15 years old
  riskToString(Risk risk) {
    if (risk == Risk.low) {
      return "L";
    } else if (risk == Risk.intermediate) {
      return "I";
    } else {
      return "H";
    }
  }

  buildTypeOfSurgery(SurgeryRisk typeOfsurgery) {
    return Container(
      color: Colors.grey.shade100,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
        child: Text(
          "${typeOfsurgery.surgeryName} (${riskToString(typeOfsurgery.risk)})",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  buildRevisedCardiacRiskIndex(int? rCRIScore) {
    return Container(
      color: Colors.grey.shade100,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
        child: Text(
          rCRIScore == null
              ? 'Note: skipped'
              : 'Total $rCRIScore point${rCRIScore > 1 ? 's' : ''}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  buildFuntionalCapacityMETs(String? fcm) {
    return Container(
      color: Colors.grey.shade100,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
        child: Text(
          fcm ?? 'Note: skipped',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  buildUnderlyingDisease(String? ud) {
    return Container(
      color: Colors.grey.shade100,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
        child: Text(
          ud ?? 'Note: skipped',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  final List<Color> tableColor = [
    Colors.grey.shade100,
    Colors.grey.shade300,
  ];
  buildSevereUnderlyingDisease(List<String> sud) {
    if (sud.isNotEmpty) {
      return Column(
        children: sud.map(
          (element) {
            int index = sud.indexOf(element);
            return Container(
              color: tableColor[index % 2],
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                child: Text(
                  element,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ).toList(),
      );
    } else {
      return Container(
        color: Colors.grey.shade100,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        child: const Padding(
          padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
          child: Text(
            'Note: skipped',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }

  buildSummary(String summary) {
    return Container(
      color: Colors.grey.shade100,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
        child: Text(
          summary,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  buildSummaryPED(List<String> summaries) {
    return DetailList(detail: summaries);
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:preoperative_patient_assessment/screens/type_of_surgery.dart';

class CriteriaForPreOperativeConsultation {
  // Age >= 15 years old
  SurgeryRisk? typeOfSurgery;
  int? revisedCardiacRiskIndex;
  String? functionalCapacity;
  String? underlyingDisease;
  List<String> severeUnderlyingDisease = [];
  String? summary;

  // Age < 15 years old
  List<String> cardioVascular = [];
  List<String> respiratory = [];
  List<String> neurological = [];
  List<String> endocrine = [];
  List<String> hematologic = [];
  List<String> others = [];

  isEmpty() {
    return (cardioVascular.isEmpty &&
        respiratory.isEmpty &&
        neurological.isEmpty &&
        endocrine.isEmpty &&
        hematologic.isEmpty &&
        others.isEmpty);
  }

  setSummary(String iSummary) {
    summary = iSummary;
  }

  copy() {
    return CriteriaForPreOperativeConsultation()
      ..typeOfSurgery = typeOfSurgery
      ..revisedCardiacRiskIndex = revisedCardiacRiskIndex
      ..functionalCapacity = functionalCapacity
      ..underlyingDisease = underlyingDisease
      ..severeUnderlyingDisease = List.from(severeUnderlyingDisease)
      ..summary = summary
      ..cardioVascular = List.from(cardioVascular)
      ..respiratory = List.from(respiratory)
      ..neurological = List.from(neurological)
      ..endocrine = List.from(endocrine)
      ..hematologic = List.from(hematologic)
      ..others = List.from(others);
  }

  @override
  String toString() {
    return 'CriteriaForPreOperativeConsultation(typeOfSurgery: $typeOfSurgery, revisedCardiacRiskIndex: $revisedCardiacRiskIndex, functionalCapacity: $functionalCapacity, underlyingDisease: $underlyingDisease, severeUnderlyingDisease: $severeUnderlyingDisease, summary: $summary, cardioVascular: $cardioVascular, respiratory: $respiratory, neurological: $neurological, endocrine: $endocrine, hematologic: $hematologic, others: $others)';
  }
}

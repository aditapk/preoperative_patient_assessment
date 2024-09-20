// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';

class AdultEvaluation {
  List<CheckListDataModel> cardiovascularSyatem;
  List<CheckListDataModel> respiratorySystem;
  List<CheckListDataModel> neurologicSystem;
  List<CheckListDataModel> renalSystem;
  List<CheckListDataModel> endocrineSystem;
  List<CheckListDataModel> hematologicSystem;
  List<CheckListDataModel> hepatobiliarySystem;
  List<CheckListDataModel> otherSystem;
  List<CheckListDataModel> medication;
  bool highriskProcedure;
  String consult;
  List<String> labs;
  AdultEvaluation({
    required this.cardiovascularSyatem,
    required this.respiratorySystem,
    required this.neurologicSystem,
    required this.renalSystem,
    required this.endocrineSystem,
    required this.hematologicSystem,
    required this.hepatobiliarySystem,
    required this.otherSystem,
    required this.medication,
    required this.highriskProcedure,
    required this.consult,
    required this.labs,
  });

  @override
  String toString() {
    return 'AdultEvaluation(cardiovascularSyatem: $cardiovascularSyatem, respiratorySystem: $respiratorySystem, neurologicSystem: $neurologicSystem, renalSystem: $renalSystem, endocrineSystem: $endocrineSystem, hematologicSystem: $hematologicSystem, hepatobiliarySystem: $hepatobiliarySystem, otherSystem: $otherSystem, medication: $medication, highriskProcedure: $highriskProcedure, consult: $consult, labs: $labs)';
  }
}

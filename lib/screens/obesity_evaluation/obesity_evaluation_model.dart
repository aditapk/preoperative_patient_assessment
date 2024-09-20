// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';

class ObesityEvaluation {
  List<CheckListDataModel> cardiovascularSystem;
  List<CheckListDataModel> respiratorySystem;
  List<CheckListDataModel> stopBANGCondition;
  List<CheckListDataModel> otherAbnormalConditions;
  String consult;
  List<String> labs;
  ObesityEvaluation({
    required this.cardiovascularSystem,
    required this.respiratorySystem,
    required this.stopBANGCondition,
    required this.otherAbnormalConditions,
    required this.consult,
    required this.labs,
  });

  // STOP BANG getter
  int get score {
    return stopBANGCondition
        .where(
          (element) => element.check,
        )
        .length;
  }

  String get level {
    if (score <= 2) {
      return 'Low';
    } else if (score > 2 && score <= 4) {
      return 'Intermediate';
    } else {
      return 'High';
    }
  }

  @override
  String toString() {
    return 'ObesityEvaluation(cardiovascularSystem: $cardiovascularSystem, respiratorySystem: $respiratorySystem, stopBANGCondition: $stopBANGCondition, otherAbnormalConditions: $otherAbnormalConditions, consult: $consult, labs: $labs)';
  }
}

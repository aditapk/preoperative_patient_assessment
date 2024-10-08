// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';
import 'package:preoperative_patient_assessment/screens/obesity_evaluation/constant_condition.dart';

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

  // get selected
  List<String> get selectedCardiovascularSystem {
    return cardiovascularSystem
        .where(
          (e1) => e1.check,
        )
        .map(
          (e2) => e2.title,
        )
        .toList();
  }

  List<String> get selectedRespiratorySystem {
    return respiratorySystem
        .where(
          (e1) => e1.check,
        )
        .map(
          (e2) => e2.title,
        )
        .toList();
  }

  List<String> get selectedSTOPBANGCondition {
    return stopBANGCondition
        .where(
          (e1) => e1.check,
        )
        .map(
          (e2) => e2.title,
        )
        .toList();
  }

  List<String> get selectedOtherAbnormalConditions {
    return otherAbnormalConditions
        .where(
          (e1) => e1.check,
        )
        .map(
          (e2) => e2.title,
        )
        .toList();
  }

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

  ObesityEvaluation copyWith({
    List<CheckListDataModel>? cardiovascularSystem,
    List<CheckListDataModel>? respiratorySystem,
    List<CheckListDataModel>? stopBANGCondition,
    List<CheckListDataModel>? otherAbnormalConditions,
    String? consult,
    List<String>? labs,
  }) {
    return ObesityEvaluation(
      cardiovascularSystem: cardiovascularSystem ?? this.cardiovascularSystem,
      respiratorySystem: respiratorySystem ?? this.respiratorySystem,
      stopBANGCondition: stopBANGCondition ?? this.stopBANGCondition,
      otherAbnormalConditions:
          otherAbnormalConditions ?? this.otherAbnormalConditions,
      consult: consult ?? this.consult,
      labs: labs ?? this.labs,
    );
  }

  List<String> get cardiovascularSystemMap {
    return cardiovascularSystem
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get respiratorySystemMap {
    return respiratorySystem
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get stopBANGConditionMap {
    return stopBANGCondition
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get otherAbnormalConditionsMap {
    return otherAbnormalConditions
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cardiovascular_system': cardiovascularSystemMap,
      'respiratory_system': respiratorySystemMap,
      'stop_BANG_condition': stopBANGConditionMap,
      'other_abnormal_conditions': otherAbnormalConditionsMap,
      'consult': consult,
      'labs': labs,
    };
  }

  factory ObesityEvaluation.fromMap(Map<String, dynamic> map) {
    // cardiovascular system from map
    var cardiovascularSystemCond =
        ObesityCondition().cardiovascularSystemCondition;
    for (var obj in cardiovascularSystemCond) {
      if (List<String>.from(map['cardiovascular_system'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // respiratory system from map
    var respiratorySystemCond = ObesityCondition().respiratorySystemCondition;
    for (var obj in respiratorySystemCond) {
      if (List<String>.from(map['respiratory_system'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // STOP BANG condition from map
    var stopBANGConditionCond = ObesityCondition().stopBANGScoreCondition;
    for (var obj in stopBANGConditionCond) {
      if (List<String>.from(map['stop_BANG_condition'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // other abnormal condition from map
    var otherAbnormalConditionsCond = ObesityCondition().otherAbnormalConditions;
    for (var obj in otherAbnormalConditionsCond) {
      if (List<String>.from(map['other_abnormal_conditions'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }

    return ObesityEvaluation(
      cardiovascularSystem: cardiovascularSystemCond,
      respiratorySystem: respiratorySystemCond,
      stopBANGCondition: stopBANGConditionCond,
      otherAbnormalConditions: otherAbnormalConditionsCond,
      consult: map['consult'] as String,
      labs: List<String>.from(
        (map['labs'] as List),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ObesityEvaluation.fromJson(String source) =>
      ObesityEvaluation.fromMap(json.decode(source) as Map<String, dynamic>);
}

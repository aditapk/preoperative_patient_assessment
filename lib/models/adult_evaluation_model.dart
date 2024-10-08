// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';
import 'package:preoperative_patient_assessment/screens/adult_evaluation/constant_condition.dart';

class AdultEvaluation {
  List<CheckListDataModel> cardiovascularSystem;
  List<CheckListDataModel> respiratorySystem;
  List<CheckListDataModel> neurologicSystem;
  List<CheckListDataModel> renalSystem;
  List<CheckListDataModel> endocrineSystem;
  List<CheckListDataModel> hematologicSystem;
  List<CheckListDataModel> hepatobiliarySystem;
  List<CheckListDataModel> othersSystem;
  List<CheckListDataModel> medication;
  bool highriskProcedure;
  bool onedaySurgery;
  String consult;
  List<String> labs;

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

  List<String> get selectedNeurologicSystem {
    return neurologicSystem
        .where(
          (e1) => e1.check,
        )
        .map(
          (e2) => e2.title,
        )
        .toList();
  }

  List<String> get selectedRenalSystem {
    return renalSystem
        .where(
          (e1) => e1.check,
        )
        .map(
          (e2) => e2.title,
        )
        .toList();
  }

  List<String> get selectedEndocrineSystem {
    return endocrineSystem
        .where(
          (e1) => e1.check,
        )
        .map(
          (e2) => e2.title,
        )
        .toList();
  }

  List<String> get selectedHematologicSystem {
    return hematologicSystem
        .where(
          (e1) => e1.check,
        )
        .map(
          (e2) => e2.title,
        )
        .toList();
  }

  List<String> get selectedHepatobiliarySystem {
    return hepatobiliarySystem
        .where(
          (e1) => e1.check,
        )
        .map(
          (e2) => e2.title,
        )
        .toList();
  }

  List<String> get selectedOthersSystem {
    return othersSystem
        .where(
          (e1) => e1.check,
        )
        .map(
          (e2) => e2.title,
        )
        .toList();
  }

  List<String> get selectedMedication {
    return medication
        .where(
          (e1) => e1.check,
        )
        .map(
          (e2) => e2.title,
        )
        .toList();
  }

  AdultEvaluation({
    required this.cardiovascularSystem,
    required this.respiratorySystem,
    required this.neurologicSystem,
    required this.renalSystem,
    required this.endocrineSystem,
    required this.hematologicSystem,
    required this.hepatobiliarySystem,
    required this.othersSystem,
    required this.medication,
    required this.highriskProcedure,
    required this.onedaySurgery,
    required this.consult,
    required this.labs,
  });

  @override
  String toString() {
    return 'AdultEvaluation(cardiovascularSyatem: $cardiovascularSystem, respiratorySystem: $respiratorySystem, neurologicSystem: $neurologicSystem, renalSystem: $renalSystem, endocrineSystem: $endocrineSystem, hematologicSystem: $hematologicSystem, hepatobiliarySystem: $hepatobiliarySystem, othersSystem: $othersSystem, medication: $medication, highriskProcedure: $highriskProcedure, onedaySurgery: $onedaySurgery, consult: $consult, labs: $labs)';
  }

  AdultEvaluation copyWith({
    List<CheckListDataModel>? cardiovascularSystem,
    List<CheckListDataModel>? respiratorySystem,
    List<CheckListDataModel>? neurologicSystem,
    List<CheckListDataModel>? renalSystem,
    List<CheckListDataModel>? endocrineSystem,
    List<CheckListDataModel>? hematologicSystem,
    List<CheckListDataModel>? hepatobiliarySystem,
    List<CheckListDataModel>? othersSystem,
    List<CheckListDataModel>? medication,
    bool? highriskProcedure,
    bool? onedaySurgery,
    String? consult,
    List<String>? labs,
  }) {
    return AdultEvaluation(
      cardiovascularSystem: cardiovascularSystem ?? this.cardiovascularSystem,
      respiratorySystem: respiratorySystem ?? this.respiratorySystem,
      neurologicSystem: neurologicSystem ?? this.neurologicSystem,
      renalSystem: renalSystem ?? this.renalSystem,
      endocrineSystem: endocrineSystem ?? this.endocrineSystem,
      hematologicSystem: hematologicSystem ?? this.hematologicSystem,
      hepatobiliarySystem: hepatobiliarySystem ?? this.hepatobiliarySystem,
      othersSystem: othersSystem ?? this.othersSystem,
      medication: medication ?? this.medication,
      highriskProcedure: highriskProcedure ?? this.highriskProcedure,
      onedaySurgery: onedaySurgery ?? this.onedaySurgery,
      consult: consult ?? this.consult,
      labs: labs ?? this.labs,
    );
  }

  List<String> get cardiovascularSyatemMap {
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

  List<String> get neurologicSystemMap {
    return neurologicSystem
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get renalSystemMap {
    return renalSystem
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get endocrineSystemMap {
    return endocrineSystem
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get hematologicSystemMap {
    return hematologicSystem
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get hepatobiliarySystemMap {
    return hepatobiliarySystem
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get othersSystemMap {
    return othersSystem
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get medicationMap {
    return medication
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
      'cardiovascular_system': cardiovascularSyatemMap,
      'respiratory_system': respiratorySystemMap,
      'neurologic_system': neurologicSystemMap,
      'renal_system': renalSystemMap,
      'endocrine_system': endocrineSystemMap,
      'hematologic_system': hematologicSystemMap,
      'hepatobiliary_system': hepatobiliarySystemMap,
      'others_system': othersSystemMap,
      'medication': medicationMap,
      'highrisk_procedure': highriskProcedure,
      'is_one_day_surgery': onedaySurgery,
      'consult': consult,
      'labs': labs,
    };
  }

  factory AdultEvaluation.fromMap(Map<String, dynamic> map) {
    // cardiovascular system from map
    var cardiovascularSystemCond = AdultCondition().cardiovascularSystemCondition;
    for (var obj in cardiovascularSystemCond) {
      if (List<String>.from(map['cardiovascular_system'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // respiratory system from map
    var respiratorySystemCond = AdultCondition().respiratorySystemCondition;
    for (var obj in respiratorySystemCond) {
      if (List<String>.from(map['respiratory_system'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // neurologic system from map
    var neurologicSystemCond = AdultCondition().neurologicSystemCondition;
    for (var obj in neurologicSystemCond) {
      if (List<String>.from(map['neurologic_system'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }

    // renal system from map
    var renalSystemCond = AdultCondition().renalSystemCondition;
    for (var obj in renalSystemCond) {
      if (List<String>.from(map['renal_system'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // endocrine system from map
    var endocrineSystemCond = AdultCondition().endocrineSystemCondition;
    for (var obj in endocrineSystemCond) {
      if (List<String>.from(map['endocrine_system'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // hemato logic system from map
    var hematologicSystemCond = AdultCondition().hematologicSystemCondition;
    for (var obj in hematologicSystemCond) {
      if (List<String>.from(map['hematologic_system'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // hepatobiliary system from map
    var hepatobiliarySystemCond = AdultCondition().hepatobilitySystemCondition;
    for (var obj in hepatobiliarySystemCond) {
      if (List<String>.from(map['hepatobiliary_system'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // other system from map
    var othersSystemCond = AdultCondition().otherSystemCondition;
    for (var obj in othersSystemCond) {
      if (List<String>.from(map['others_system'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }

    // medication from map
    var medicationCond = AdultCondition().medicationCondition;
    for (var obj in medicationCond) {
      if (List<String>.from(map['medication'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }

    return AdultEvaluation(
      cardiovascularSystem: cardiovascularSystemCond,
      respiratorySystem: respiratorySystemCond,
      neurologicSystem: neurologicSystemCond,
      renalSystem: renalSystemCond,
      endocrineSystem: endocrineSystemCond,
      hematologicSystem: hematologicSystemCond,
      hepatobiliarySystem: hepatobiliarySystemCond,
      othersSystem: othersSystemCond,
      medication: medicationCond,
      highriskProcedure: map['highrisk_procedure'] as bool,
      onedaySurgery: map['is_one_day_surgery'] as bool,
      consult: map['consult'] as String,
      labs: List<String>.from(
        (map['labs'] as List),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AdultEvaluation.fromJson(String source) =>
      AdultEvaluation.fromMap(json.decode(source) as Map<String, dynamic>);
}

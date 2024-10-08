// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';

import '../screens/pediatrics_evaluation/constant_condition.dart';

class PediatricsEvaluation {
  List<CheckListDataModel> cvs;
  List<CheckListDataModel> rs;
  List<CheckListDataModel> cns;
  List<CheckListDataModel> endocrine;
  List<CheckListDataModel> hemato;
  List<CheckListDataModel> other;
  String? comment;
  String? consult;
  bool? isPostOperativeICU;
  bool? isOneDaySurgery;
  PediatricsEvaluation({
    required this.cvs,
    required this.rs,
    required this.cns,
    required this.endocrine,
    required this.hemato,
    required this.other,
    this.comment,
    this.consult,
    this.isPostOperativeICU,
    this.isOneDaySurgery,
  });

  List<String> get selectedCVS {
    return cvs
        .where(
          (e1) => e1.check,
        )
        .map((e2) => e2.title)
        .toList();
  }

  List<String> get selectedRS {
    return rs
        .where(
          (e1) => e1.check,
        )
        .map((e2) => e2.title)
        .toList();
  }

  List<String> get selectedCNS {
    return cns
        .where(
          (e1) => e1.check,
        )
        .map((e2) => e2.title)
        .toList();
  }

  List<String> get selectedEndocrine {
    return endocrine
        .where(
          (e1) => e1.check,
        )
        .map((e2) => e2.title)
        .toList();
  }

  List<String> get seletedHemato {
    return hemato
        .where(
          (e1) => e1.check,
        )
        .map((e2) => e2.title)
        .toList();
  }

  List<String> get selectedOther {
    return other
        .where(
          (e1) => e1.check,
        )
        .map((e2) => e2.title)
        .toList();
  }

  @override
  String toString() {
    return 'PediatricsEvaluation(cvs: $cvs, rs: $rs, cns: $cns, endocrine: $endocrine, hemato: $hemato, other: $other, comment: $comment, consult: $consult, isPostOperativeICU: $isPostOperativeICU, isOneDaySurgery: $isOneDaySurgery)';
  }

  PediatricsEvaluation copyWith({
    List<CheckListDataModel>? cvs,
    List<CheckListDataModel>? rs,
    List<CheckListDataModel>? cns,
    List<CheckListDataModel>? endocrine,
    List<CheckListDataModel>? hemato,
    List<CheckListDataModel>? other,
    String? comment,
    String? consult,
    bool? isPostOperativeICU,
    bool? isOneDaySurgery,
  }) {
    return PediatricsEvaluation(
      cvs: cvs ?? this.cvs,
      rs: rs ?? this.rs,
      cns: cns ?? this.cns,
      endocrine: endocrine ?? this.endocrine,
      hemato: hemato ?? this.hemato,
      other: other ?? this.other,
      comment: comment ?? this.comment,
      consult: consult ?? this.consult,
      isPostOperativeICU: isPostOperativeICU ?? this.isPostOperativeICU,
      isOneDaySurgery: isOneDaySurgery ?? this.isOneDaySurgery,
    );
  }

  List<String> get cvsMap {
    return cvs
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get rsMap {
    return rs
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get cnsMap {
    return cns
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get endocrineMap {
    return endocrine
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get hematoMap {
    return hemato
        .where(
          (e) => e.check == true,
        )
        .map(
          (x) => x.title,
        )
        .toList();
  }

  List<String> get otherMap {
    return other
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
      'CVS': cvsMap,
      'RS': rsMap,
      'CNS': cnsMap,
      'endocrine': endocrineMap,
      'hemato': hematoMap,
      'other': otherMap,
      'comment': comment,
      'consult': consult,
      'is_post_operative_ICU': isPostOperativeICU,
      'is_one_day_surgery': isOneDaySurgery,
    };
  }

  factory PediatricsEvaluation.fromMap(Map<String, dynamic> map) {
    // CVS from map
    var cvsObj = PediatricsCondition().cnsCondition;
    for (var obj in cvsObj) {
      if (List<String>.from(map['CVS'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // RS from map
    var rsObj = PediatricsCondition().rsCondition;
    for (var obj in rsObj) {
      if (List<String>.from(map['RS'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // CNS from map
    var cnsObj = PediatricsCondition().cnsCondition;
    for (var obj in cnsObj) {
      if (List<String>.from(map['CNS'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // Endocrine from Map
    var endocrineObj = PediatricsCondition().endocrineCondition;
    for (var obj in endocrineObj) {
      if (List<String>.from(map['endocrine'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // hemato from Map
    var hematoObj = PediatricsCondition().hematoCondition;
    for (var obj in hematoObj) {
      if (List<String>.from(map['hemato'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    // Other from Map
    var otherObj = PediatricsCondition().otherCondition;
    for (var obj in otherObj) {
      if (List<String>.from(map['other'] as List)
          .any((e) => e.contains(obj.title))) {
        obj.check = true;
      }
    }
    return PediatricsEvaluation(
      cvs: cvsObj,
      rs: rsObj,
      cns: cnsObj,
      endocrine: endocrineObj,
      hemato: hematoObj,
      other: otherObj,
      comment: map['comment'] != null ? map['comment'] as String : null,
      consult: map['consult'] != null ? map['consult'] as String : null,
      isPostOperativeICU: map['is_post_operative_ICU'] != null
          ? map['is_post_operative_ICU'] as bool
          : null,
      isOneDaySurgery: map['is_one_day_surgery'] != null
          ? map['is_one_day_surgery'] as bool
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PediatricsEvaluation.fromJson(String source) =>
      PediatricsEvaluation.fromMap(json.decode(source) as Map<String, dynamic>);
}

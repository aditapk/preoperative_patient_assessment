// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';

class PediatricsEvaluation {
  List<CheckListDataModel> cvs;
  List<CheckListDataModel> rs;
  List<CheckListDataModel> cns;
  List<CheckListDataModel> endocrine;
  List<CheckListDataModel> hemato;
  List<CheckListDataModel> other;
  String? comment;
  String? consult;
  PediatricsEvaluation({
    required this.cvs,
    required this.rs,
    required this.cns,
    required this.endocrine,
    required this.hemato,
    required this.other,
    this.comment,
    this.consult,
  });

  @override
  String toString() {
    return 'PediatricsEvaluation(cvs: $cvs, rs: $rs, cns: $cns, endocrine: $endocrine, hemato: $hemato, other: $other, comment: $comment, consult: $consult)';
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
    );
  }
}

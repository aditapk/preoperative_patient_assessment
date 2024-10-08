// ignore_for_file: public_member_api_docs, sort_constructors_first
class CheckListDataModel {
  String title;
  bool check;
  CheckListDataModel({
    required this.title,
    this.check = false,
  });

  @override
  String toString() => 'CheckListDataModel(title: $title, check: $check)';

  CheckListDataModel copyWith({
    String? title,
    bool? check,
  }) {
    return CheckListDataModel(
      title: title ?? this.title,
      check: check ?? this.check,
    );
  }
}

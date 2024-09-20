import '../models/check_list_data_model.dart';

bool isSelectedIn({required List<String> selected, required List<CheckListDataModel> list}) {
    return selected.any(
      (selectE) => list
          .map(
            (e) => e.title,
          )
          .toList()
          .contains(selectE),
    );
  }
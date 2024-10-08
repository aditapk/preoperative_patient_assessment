import '../../models/check_list_data_model.dart';

class PediatricsCondition {
  // CVS
  List<CheckListDataModel> get cvsCondition {
    return [
      'Cyanotic heart disease',
      'Symptomatic heart failure',
      'New cardiac abnormalities',
      'Post cardiac surgery',
    ]
        .map(
          (e) => CheckListDataModel(title: e),
        )
        .toList();
  }

  // RS
  List<CheckListDataModel> get rsCondition {
    return [
      'History of BPD or severe chronic Lung disease',
      'Asthma exacerbation within 3 months',
    ]
        .map(
          (e) => CheckListDataModel(title: e),
        )
        .toList();
  }

  // CNS
  List<CheckListDataModel> get cnsCondition {
    return [
      'Uncontrolled epilepsy (Last seizure within 1 year)',
      'Craniopharyngioma',
    ]
        .map(
          (e) => CheckListDataModel(title: e),
        )
        .toList();
  }

  // Endocrine (Uncontrolled conditions)
  List<CheckListDataModel> get endocrineCondition {
    return [
      'DM',
      'DI',
      'Hyperthyriod',
      'Adrenal insufficientcy',
    ]
        .map(
          (e) => CheckListDataModel(title: e),
        )
        .toList();
  }

  // Hemato
  List<CheckListDataModel> get hematoCondition {
    return [
      'Hematologic disorder',
      'Bleeding disorder',
      'Abnomal CBC (Hb < 10 g/dL, Wbc < 3000, ANC < 1500, Plt < 100000)',
    ]
        .map(
          (e) => CheckListDataModel(title: e),
        )
        .toList();
  }

  // Other
  List<CheckListDataModel> get otherCondition {
    return [
      'Pediatric morbid obesity',
      'อื่นๆ โปรดระบุ',
    ]
        .map(
          (e) => CheckListDataModel(title: e),
        )
        .toList();
  }
}

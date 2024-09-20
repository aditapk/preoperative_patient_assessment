import '../../models/check_list_data_model.dart';

class PediatricsCondition {
  // CVS
  static List<CheckListDataModel> cvsCondition = [
    CheckListDataModel(title: 'Cyanotic heart disease'),
    CheckListDataModel(title: 'Symptomatic heart failure'),
    CheckListDataModel(title: 'New cardiac abnormalities'),
    CheckListDataModel(title: 'Post cardiac surgery'),
  ];

  // RS
  static List<CheckListDataModel> rsCondition = [
    CheckListDataModel(title: 'History of BPD or severe chronic Lung disease'),
    CheckListDataModel(title: 'Asthma exacerbation within 3 months')
  ];

  // CNS
  static List<CheckListDataModel> cnsCondition = [
    CheckListDataModel(
        title: 'Uncontrolled epilepsy (Last seizure within 1 year)'),
    CheckListDataModel(title: 'Craniopharyngioma'),
  ];
  // Endocrine (Uncontrolled conditions)
  static List<CheckListDataModel> endocrineCondition = [
    CheckListDataModel(title: 'DM'),
    CheckListDataModel(title: 'DI'),
    CheckListDataModel(title: 'Hyperthyriod'),
    CheckListDataModel(title: 'Adrenal insufficientcy'),
  ];
  // Hemato
  static List<CheckListDataModel> hematoCondition = [
    CheckListDataModel(title: 'Hematologic disorder'),
    CheckListDataModel(title: 'Bleeding disorder'),
    CheckListDataModel(
        title:
            'Abnomal CBC (Hb < 10 g/dL, Wbc < 3000, ANC < 1500, Plt < 100000)'),
  ];
  // Other
  static List<CheckListDataModel> otherCondition = [
    CheckListDataModel(title: 'Pediatric morbid obesity'),
    CheckListDataModel(title: 'อื่นๆ โปรดระบุ'),
  ];
}

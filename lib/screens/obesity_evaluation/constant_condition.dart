import '../../models/check_list_data_model.dart';

class ObesityCondition {
  // Cardiovascular system
  // static List<CheckListDataModel> cardiovascularSystemCondition = [
  //   CheckListDataModel(title: 'Functional class > 2'),
  //   CheckListDataModel(title: 'Hypertension (BP > 160/100 mmHg)'),
  //   CheckListDataModel(title: 'Abnormal CXR (Cardiomegaly, Pulmonary edema)'),
  //   CheckListDataModel(
  //       title: 'Abnormal EKG (Arrhythmia, Ventricular hypertrophy)'),
  // ];
  List<CheckListDataModel> get cardiovascularSystemCondition {
    return [
      'Functional class > 2',
      'Hypertension (BP > 160/100 mmHg)',
      'Abnormal CXR (Cardiomegaly, Pulmonary edema)',
      'Abnormal EKG (Arrhythmia, Ventricular hypertrophy)',
    ]
        .map(
          (e) => CheckListDataModel(title: e),
        )
        .toList();
  }

  // Respiratory system
  // static List<CheckListDataModel> respiratorySystemCondition = [
  //   CheckListDataModel(title: 'SpO2 < 95%'),
  //   CheckListDataModel(title: 'HCO3 < 27'),
  //   CheckListDataModel(title: 'COPD'),
  //   CheckListDataModel(title: 'Asthma'),
  // ];
  List<CheckListDataModel> get respiratorySystemCondition {
    return [
      'SpO2 < 95%',
      'HCO3 < 27',
      'COPD',
      'Asthma',
    ]
        .map(
          (e) => CheckListDataModel(title: e),
        )
        .toList();
  }

  // Other abnormal conditions
  // static List<CheckListDataModel> otherAbnormalConditions = [
  //   CheckListDataModel(title: 'Recent stroke < 3 months'),
  //   CheckListDataModel(title: 'Active autoimmune diseases'),
  //   CheckListDataModel(title: 'CKD Cr > 3 or GFR < 15'),
  //   CheckListDataModel(title: 'Poor control DM'),
  //   CheckListDataModel(title: 'Hepatobiliary diseases'),
  //   CheckListDataModel(title: 'Bleeding disorder'),
  //   CheckListDataModel(title: 'On ARV drugs'),
  //   CheckListDataModel(title: 'On anticoagulants'),
  // ];
  List<CheckListDataModel> get otherAbnormalConditions {
    return [
      'Recent stroke < 3 months',
      'Active autoimmune diseases',
      'CKD Cr > 3 or GFR < 15',
      'Poor control DM',
      'Hepatobiliary diseases',
      'Bleeding disorder',
      'On ARV drugs',
      'On anticoagulants',
    ]
        .map(
          (e) => CheckListDataModel(title: e),
        )
        .toList();
  }

  // STOP BANG Condition
  // static List<CheckListDataModel> stopBangScoreCondition = [
  //   CheckListDataModel(title: 'Snoring'),
  //   CheckListDataModel(title: 'Tired during daytime'),
  //   CheckListDataModel(title: 'Observed apnea'),
  //   CheckListDataModel(title: 'Pressure Hypertension'),
  //   CheckListDataModel(title: 'BMI > 35'),
  //   CheckListDataModel(title: 'Age > 50'),
  //   CheckListDataModel(title: 'Neck circumference > 40 cm'),
  //   CheckListDataModel(title: 'Gender male'),
  // ];
  List<CheckListDataModel> get stopBANGScoreCondition {
    return [
      'Snoring',
      'Tired during daytime',
      'Observed apnea',
      'Pressure Hypertension',
      'BMI > 35',
      'Age > 50',
      'Neck circumference > 40 cm',
      'Gender male',
    ]
        .map(
          (e) => CheckListDataModel(title: e),
        )
        .toList();
  }

  // star condition
  static List<CheckListDataModel> starCondition = [
    // Other abnormal conditions
    CheckListDataModel(title: 'Hepatobiliary diseases'),
    CheckListDataModel(title: 'Bleeding disorder'),
  ];


}

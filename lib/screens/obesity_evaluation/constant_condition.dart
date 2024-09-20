import '../../models/check_list_data_model.dart';

class ObesityCondition {
  // Cardiovascular system
  static List<CheckListDataModel> cardiovascularSystemCondition = [
    CheckListDataModel(title: 'Functional class > 2'),
    CheckListDataModel(title: 'Hypertension (BP > 160/100 mmHg)'),
    CheckListDataModel(title: 'Abnormal CXR (Cardiomegaly, Pulmonary edema)'),
    CheckListDataModel(
        title: 'Abnormal EKG (Arrhythmia, Ventricular hypertrophy)'),
  ];
  // Respiratory system
  static List<CheckListDataModel> respiratorySystemCondition = [
    CheckListDataModel(title: 'SpO2 < 95%'),
    CheckListDataModel(title: 'HCO3 < 27'),
    CheckListDataModel(title: 'COPD'),
    CheckListDataModel(title: 'Asthma'),
  ];

  // Other abnormal conditions
  static List<CheckListDataModel> otherAbnormalConditions = [
    CheckListDataModel(title: 'Recent stroke < 3 months'),
    CheckListDataModel(title: 'Active autoimmune diseases'),
    CheckListDataModel(title: 'CKD Cr > 3 or GFR < 15'),
    CheckListDataModel(title: 'Poor control DM'),
    CheckListDataModel(title: 'Hepatobiliary diseases'),
    CheckListDataModel(title: 'Bleeding disorder'),
    CheckListDataModel(title: 'On ARV drugs'),
    CheckListDataModel(title: 'On anticoagulants'),
  ];
  // STOP BANG Condition
  static List<CheckListDataModel> stopBangScoreCondition = [
    CheckListDataModel(title: 'Snoring'),
    CheckListDataModel(title: 'Tired during daytime'),
    CheckListDataModel(title: 'Observed apnea'),
    CheckListDataModel(title: 'Pressure Hypertension'),
    CheckListDataModel(title: 'BMI > 35'),
    CheckListDataModel(title: 'Age > 50'),
    CheckListDataModel(title: 'Neck circumference > 40 cm'),
    CheckListDataModel(title: 'Gender male'),
  ];

  // star condition
  static List<CheckListDataModel> starCondition = [
    // Other abnormal conditions
    CheckListDataModel(title: 'Hepatobiliary diseases'),
    CheckListDataModel(title: 'Bleeding disorder'),
  ];
}

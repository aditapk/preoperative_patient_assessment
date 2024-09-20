import '../../models/check_list_data_model.dart';

class AdultCondition {
  // Star state condition
  static List<String> starCondition = [
    // Cardiovascular System
    'Hypertension',
    'Stable cardiac disease',
    'Other arrhythmia or abnormal EKG',
    // Respirotory System
    'COPD/Asthma Well-controlled',
    'Other abnormal CXR',
    'Chronic lung disease',
    // Neurologic System
    'Other neurological conditions'
        // Endocrine System
        'DM Well controlled',
    'Thyroid (clinical euthyroid)',
    // Hematologic System
    'Anemia',
    'Bleeding disorder/hypercoagulation disorders',
    'Abnormal CBC, coagulation',
    // Hepatobiliary System
    'Cirrhosis',
    'Hepatocellular carcinoma',
    'Cholangiocarcinoma',
    'Active hepatitis',
    'Other liver disease',
    // Other System
    'Inactive autoimmune diseases',
    // Medication
    'On Diuretic',
    'On Digoxin',
    'On Antipsychotic',
  ];
  // Cardiovascular system
  static List<CheckListDataModel> cardiovascularSystemCondition = [
    CheckListDataModel(title: 'Hypertension'),
    CheckListDataModel(title: 'Hypertension (BP > 180/100 mmHg)'),
    CheckListDataModel(
        title:
            'Active cardiac condition\n\t - Active IHD\n\t - Cardiomyopathy\n\t - Life threatening arrhythmia\n\t - Recent heart failure'),
    CheckListDataModel(title: 'Stable cardiac disease'),
    CheckListDataModel(title: 'Other arrhythmia or abnormal EKG'),
    CheckListDataModel(title: 'On pacemaker'),
  ];
  // Respiratory system
  static List<CheckListDataModel> respiratorySystemCondition = [
    CheckListDataModel(title: 'COPD/Asthma Well-controlled'),
    CheckListDataModel(title: 'COPD/Asthma Poor-controlled'),
    CheckListDataModel(title: 'Suspected TB/Pneumonia'),
    CheckListDataModel(title: 'Other abnormal CXR'),
    CheckListDataModel(title: 'Chronic lung disease'),
  ];

  // Neurologic system
  static List<CheckListDataModel> neurologicSystemCondition = [
    CheckListDataModel(title: 'Recent stroke < 3 months'),
    CheckListDataModel(title: 'Other neurological conditions'),
  ];

  // Renal system
  static List<CheckListDataModel> renalSystemCondition = [
    CheckListDataModel(
        title: 'Chronic kidney disease (Cr > 3 mg/dL, GFR < 15 ml/min/1.73m2)'),
    CheckListDataModel(title: 'Suspected AKI')
  ];

  // Endocrine system
  static List<CheckListDataModel> endocrineSystemCondition = [
    CheckListDataModel(title: 'DM Well controlled'),
    CheckListDataModel(
        title: 'DM poor controlled (FBS > 180 mg/dL, HbA1c > 8%)'),
    CheckListDataModel(title: 'Active thyroid'),
    CheckListDataModel(title: 'Thyroid (clinical euthyroid)'),
  ];

  // Hematologic system
  static List<CheckListDataModel> hemotologicSystemCondition = [
    CheckListDataModel(title: 'Anemia'),
    CheckListDataModel(title: 'Bleeding disorder/hypercoagulation disorders'),
    CheckListDataModel(title: 'Abnormal CBC, coagulation'),
  ];

  // Hepatobility system
  static List<CheckListDataModel> hepatobilitySystemCondition = [
    CheckListDataModel(title: 'Cirrhosis'),
    CheckListDataModel(title: 'Hepatocellular carcinoma'),
    CheckListDataModel(title: 'Cholangiocarcinoma'),
    CheckListDataModel(title: 'Active hepatitis'),
    CheckListDataModel(title: 'Other liver disease')
  ];

  // Other system
  static List<CheckListDataModel> otherSystemCondition = [
    CheckListDataModel(title: 'Active SLE'),
    CheckListDataModel(title: 'Active rheumatoid arthritis'),
    CheckListDataModel(title: 'Active scleroderma'),
    CheckListDataModel(title: 'Inactive autoimmune diseases'),
    CheckListDataModel(title: 'Suspected/Diagnotic Cancer'),
  ];

  // Medication
  static List<CheckListDataModel> medicationCondition = [
    CheckListDataModel(title: 'On antiviral drugs'),
    CheckListDataModel(title: 'On Diuretic'),
    CheckListDataModel(title: 'On Digoxin'),
    CheckListDataModel(title: 'On Anticoagulant'),
    CheckListDataModel(title: 'On Antipsychotic'),
  ];
}

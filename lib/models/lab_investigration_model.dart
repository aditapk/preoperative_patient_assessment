class LabInvestigration {
  // age >= 15 years old
  List<String> comorbidity = [];
  List<String> majorOperation = [];

  // age < 15 years old
  List<String> riskForOperationBleeding = [];
  List<String> riskAssociatedConditions = [];

  // all age
  List<String> specialDrug = [];

  // for age >= 15 years old
  final Set<String> planA = {'CBC', 'Anti-HIV', 'CXR'};
  final Set<String> planB = {
    'CBC',
    'Anti-HIV',
    'BUN',
    'Cr',
    'FBS',
    'CXR',
    'EKG'
  };
  final Set<String> planC = {
    'CBC',
    'Anti-HIV',
    'BUN',
    'Cr',
    'FBS',
    'Electrolyte',
    'CXR',
    'EKG'
  };
  final Set<String> planD = {
    'CBC',
    'Anti-HIV',
    'BUN',
    'Cr',
    'FBS',
    'Electrolyte',
    'CXR',
    'EKG',
    'PT',
    'PTT',
    'INR'
  };

  // for age < 15 years old
  final Set<String> planA1 = {
    'CBC',
    'CXR',
  };
  final Set<String> planB1 = {
    'CBC',
    'PT',
    'INR',
    'PTT',
  };
  final Set<String> planC1 = {
    'CBC',
    'CXR',
    'EKG',
    'echo',
  };
  final Set<String> planD1 = {
    'CBC',
    'PT',
    'INR',
    'PTT',
    'BUN',
    'Cr',
    'Electrolyte',
  };

  LabInvestigration copy() {
    return LabInvestigration()
      ..comorbidity = List.from(comorbidity)
      ..majorOperation = List.from(majorOperation)
      ..specialDrug = List.from(specialDrug)
      ..riskForOperationBleeding = List.from(riskForOperationBleeding)
      ..riskAssociatedConditions = List.from(riskAssociatedConditions);
  }

  clear() {
    comorbidity = [];
    majorOperation = [];
    specialDrug = [];
    riskForOperationBleeding = [];
    riskAssociatedConditions = [];
  }

  List<String> getOperativePlanListLess15() {
    Set<String> planList = {};

    // Risk for operation bleeding
    if (riskForOperationBleeding.isNotEmpty) {
      planList.addAll(planB1);
    }

    // Risk associated conditions
    if (riskAssociatedConditions.contains('PCA < 60 weeks')) {
      planList.addAll(planA1.union({'BS'}));
    }
    if (riskAssociatedConditions.contains('History of airway problem')) {
      planList.addAll(planA1);
    }
    if (riskAssociatedConditions.contains('Pulmonary')) {
      planList.addAll(planA1);
    }
    if (riskAssociatedConditions.contains('Cystic fibrosis')) {
      planList.addAll(planA1.difference({'CBC'}).union({'PFTs'}));
    }
    if (riskAssociatedConditions.contains('CVS')) {
      planList.addAll(planC1);
    }
    if (riskAssociatedConditions.contains('Renal')) {
      planList.addAll(planD1);
    }
    if (riskAssociatedConditions.contains('Hepatobiliary')) {
      planList.addAll(planA1.union({'LFT'}));
    }
    if (riskAssociatedConditions.contains('Sickle cell')) {
      planList.addAll(planB1);
    }
    if (riskAssociatedConditions.contains('Emergency (trauma)')) {
      planList.addAll(planD1.union({'CXR'}));
    }
    if (riskAssociatedConditions.contains('DM')) {
      planList.addAll({'BS', 'HbA1C', 'Electrolyte'});
    }

    // special drug
    if (specialDrug.contains('Diuretics drug')) {
      planList.addAll({'BUN', 'Cr', 'Electrolyte'});
    }
    if (specialDrug.contains('Digoxin drug')) {
      planList.addAll({'BUN', 'Cr', 'Electrolyte'});
    }
    if (specialDrug.contains('Steroid drug')) {
      planList.addAll({'FBS', 'Electrolyte'});
    }
    if (specialDrug.contains('Anticoagulant drug')) {
      planList.addAll({'PT', 'PTT', 'INR'});
    }
    if (specialDrug.contains('Antipsychotic drug')) {
      planList.addAll({'BUN', 'Cr', 'Electrolyte'});
    }

    return planList.toList();
  }

  List<String> getOperativePlanList15To45() {
    Set<String> planList = {};

    // Comorbidity
    if (comorbidity.isEmpty) {
      planList.addAll(planA);
    } else {
      if (comorbidity.contains('CVS')) {
        planList.addAll(planB);
      }
      if (comorbidity.contains('Pulmonary')) {
        planList.addAll(planA);
      }
      if (comorbidity.contains('Renal')) {
        planList.addAll(planC.difference({'EKG'}));
      }
      if (comorbidity.contains('DM')) {
        planList.addAll(planC);
      }
      if (comorbidity.contains('CNS')) {
        planList.addAll(planA.union({'BUN', 'Cr', 'Electrolyte'}));
      }
      if (comorbidity.contains('Hematologic')) {
        planList.addAll(planA.union({'PT', 'PTT', 'INR'}));
      }
      if (comorbidity.contains('Hepatobiliary')) {
        planList.addAll(planD.union({'EKG', 'LFT'}));
      }
      if (comorbidity.contains('Autoimmune')) {
        planList.addAll(planD);
      }
      if (comorbidity.contains('obesity')) {
        planList.addAll(planD.union({'LFT', 'PFT', 'Ca', 'PO4', 'Mg'}));
      }
    }
    // major operation
    if (majorOperation.isNotEmpty) {
      planList.addAll(planD);
    }

    // special drug
    if (specialDrug.contains('Diuretics drug')) {
      planList.addAll({'BUN', 'Cr', 'Electrolyte'});
    }
    if (specialDrug.contains('Digoxin drug')) {
      planList.addAll({'BUN', 'Cr', 'Electrolyte'});
    }
    if (specialDrug.contains('Steroid drug')) {
      planList.addAll({'FBS', 'Electrolyte'});
    }
    if (specialDrug.contains('Anticoagulant drug')) {
      planList.addAll({'PT', 'PTT', 'INR'});
    }
    if (specialDrug.contains('Antipsychotic drug')) {
      planList.addAll({'BUN', 'Cr', 'Electrolyte'});
    }

    return planList.toList();
  }

  List<String> getOperativePlanListOver45() {
    Set<String> planList = {};
    // Co-mobidity
    if (comorbidity.isEmpty) {
      planList.addAll(planB);
    } else {
      if (comorbidity.contains('CVS')) {
        planList.addAll(planB);
      }
      if (comorbidity.contains('Pulmonary')) {
        planList.addAll(planB);
      }
      if (comorbidity.contains('Renal')) {
        planList.addAll(planC);
      }
      if (comorbidity.contains('DM')) {
        planList.addAll(planC);
      }
      if (comorbidity.contains('CNS')) {
        planList.addAll(planC);
      }
      if (comorbidity.contains('Hematologic')) {
        planList.addAll(planD);
      }
      if (comorbidity.contains('Hepatobiliary')) {
        planList.addAll(planD.union({'LFT'}));
      }
      if (comorbidity.contains('Autoimmune')) {
        planList.addAll(planD);
      }
      if (comorbidity.contains('obesity')) {
        planList.addAll(planD.union({'LFT', 'PFT', 'Ca', 'PO4', 'Mg'}));
      }
    }

    // major operation
    if (majorOperation.isNotEmpty) {
      planList.addAll(planD);
    }
    // special drug
    if (specialDrug.contains('Diuretics drug')) {
      planList.addAll({'BUN', 'Cr', 'Electrolyte'});
    }
    if (specialDrug.contains('Digoxin drug')) {
      planList.addAll({'BUN', 'Cr', 'Electrolyte'});
    }
    if (specialDrug.contains('Steroid drug')) {
      planList.addAll({'FBS', 'Electrolyte'});
    }
    if (specialDrug.contains('Anticoagulant drug')) {
      planList.addAll({'PT', 'PTT', 'INR'});
    }
    if (specialDrug.contains('Antipsychotic drug')) {
      planList.addAll({'BUN', 'Cr', 'Electrolyte'});
    }

    return planList.toList();
  }

  addComorbidityItem(String item) {
    comorbidity.add(item);
  }

  removeComorbidityItem(String item) {
    comorbidity.remove(item);
  }

  addMajorOperationItem(String item) {
    majorOperation.add(item);
  }

  removeMajorOperationItem(String item) {
    majorOperation.remove(item);
  }

  addRiskForOperationBleedingItem(String item) {
    riskForOperationBleeding.add(item);
  }

  removeRiskForOperationBleedingItem(String item) {
    riskForOperationBleeding.remove(item);
  }

  addRiskAssociatedConditionsItem(String item) {
    riskAssociatedConditions.add(item);
  }

  removeRiskAssociatedConditionsItem(String item) {
    riskAssociatedConditions.remove(item);
  }

  addSpecialDrugItem(String item) {
    specialDrug.add(item);
  }

  removeSpecialDrugItem(String item) {
    specialDrug.remove(item);
  }
}

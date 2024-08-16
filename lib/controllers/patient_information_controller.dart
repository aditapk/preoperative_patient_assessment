import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/models/criteria_for_preoperative_consultation_model.dart';
import 'package:preoperative_patient_assessment/models/lab_investigration_model.dart';
import 'package:preoperative_patient_assessment/models/patient_information_model.dart';
import 'package:preoperative_patient_assessment/models/patient_sugery_infomation.dart';

class PatientInformationController extends GetxController {
  List<PatientSurgeryInformation> patientSurgeryInfos = [];
  // List<LabSuggestion> labSuggestions = [];
  PatientSurgeryInformation? currentPatientSurgeryInfo;

  // Laboratory Investigation
  LabInvestigration labInvestigration = LabInvestigration();

  // Criteria for preoperative pediatric consultation
  CriteriaForPreOperativeConsultation criteriaForPreOperativeConsultation =
      CriteriaForPreOperativeConsultation();

  // Preoperative assessment of the obesity patient

  // Preoperative assessment of the geriatric patient

  // addPatientInfos(PatientSurgeryInformation patientSurgeryInfo) {
  //   patientSurgeryInfos.add(patientSurgeryInfo);
  //   update();
  // }

  updatePatientSurgeryInfo() {
    PatientSurgeryInformation tPatientSurgeryInfo = PatientSurgeryInformation();
    tPatientSurgeryInfo.patientInfo =
        currentPatientSurgeryInfo!.patientInfo!.copy();
    tPatientSurgeryInfo.labInvestigatings =
        List.from(currentPatientSurgeryInfo!.labInvestigatings);
    tPatientSurgeryInfo.criteriaForPreOperativeConsultation = List.from(
        currentPatientSurgeryInfo!.criteriaForPreOperativeConsultation);

    patientSurgeryInfos.add(tPatientSurgeryInfo);
    //update();
  }

  addLabInvertigration() {
    currentPatientSurgeryInfo!.labInvestigatings.add(labInvestigration.copy());
    // clear lab investigration
    labInvestigration = LabInvestigration();
    update();
  }

  addCriteriaForPreOperativeConsultation() {
    currentPatientSurgeryInfo!.criteriaForPreOperativeConsultation
        .add(criteriaForPreOperativeConsultation.copy());

    // clear criteria ...
    criteriaForPreOperativeConsultation = CriteriaForPreOperativeConsultation();
    update();
  }

  setPatientInfo(PatientInformation patientInfo) {
    currentPatientSurgeryInfo?.patientInfo = patientInfo.copy();
    update();
  }

  int getTotal() {
    return patientSurgeryInfos.length;
  }

  int getAdultNo() {
    int adult = 0;
    for (var element in patientSurgeryInfos) {
      if (element.patientInfo!.age >= 15) {
        adult = adult + 1;
      }
    }
    return adult;
  }

  int getPediatricNo() {
    int pediatrics = 0;
    for (var element in patientSurgeryInfos) {
      if (element.patientInfo!.age < 15) {
        pediatrics = pediatrics + 1;
      }
    }
    return pediatrics;
  }
}

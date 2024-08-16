import 'package:preoperative_patient_assessment/models/criteria_for_preoperative_consultation_model.dart';
import 'package:preoperative_patient_assessment/models/lab_investigration_model.dart';
import 'package:preoperative_patient_assessment/models/patient_information_model.dart';

class PatientSurgeryInformation {
  PatientInformation? patientInfo;
  List<LabInvestigration> labInvestigatings = [];
  List<CriteriaForPreOperativeConsultation>
      criteriaForPreOperativeConsultation = [];
}

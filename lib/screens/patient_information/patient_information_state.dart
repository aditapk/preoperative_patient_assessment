import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/models/patient_information_model.dart';

class PatientInformationController extends GetxController {
  PatientInformation? state;
  updateState(PatientInformation newState) {
    state ??= newState;
  }
}

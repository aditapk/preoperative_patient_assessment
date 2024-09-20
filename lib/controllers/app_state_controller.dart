import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/screens/adult_evaluation/adult_evaluation_model.dart';
import 'package:preoperative_patient_assessment/screens/pediatrics_evaluation/pediatrics_evaluation_model.dart';
import '../models/physician_information_model.dart';

import '../models/patient_information_model.dart';
import '../screens/obesity_evaluation/obesity_evaluation_model.dart';

class PatientStateController extends GetxController {
  Patient? state;

  setState(Patient newState) {
    state = newState;
  }
}

class PhysicientStateController extends GetxController {
  Physician? state;

  setState(Physician newState) {
    state = newState;
  }
}

class PedEvalStateController extends GetxController {
  // pediatric
  PediatricsEvaluation? state;

  setState(PediatricsEvaluation newState) {
    state = newState;
  }

  setConsult(String consult) {
    state!.copyWith(consult: consult);
  }
}

class AdultEvalStateController extends GetxController {
  AdultEvaluation? state;

  setState(AdultEvaluation newState) {
    state = newState;
  }
}

class ObesityEvalStateController extends GetxController {
  ObesityEvaluation? state;

  setState(ObesityEvaluation newState) {
    state = newState;
  }
}

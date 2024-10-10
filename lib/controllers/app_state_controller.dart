import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/models/adult_evaluation_model.dart';
import 'package:preoperative_patient_assessment/models/pediatrics_evaluation_model.dart';
import '../constant.dart';
import '../models/physician_information_model.dart';

import '../models/patient_information_model.dart';
import '../models/obesity_evaluation_model.dart';
import '../services/patient_firestore_service.dart';

class PatientRegisterStateController extends GetxController {
  List<Patient> state = [];
  List<String> ids = [];

  var patientFirestoreService = PatientFirestoreService();

  removeAt(int index) {
    state.removeAt(index);
    ids.removeAt(index);
    update();
  }

  append(Patient patient) {
    state.add(patient.copyWith());
  }

  updatePatientWithId(String pid, Patient patient) {
    int index = ids.indexOf(pid);
    state[index] = patient.copyWith();
  }

  updateId(String id) {
    ids.add(id);
  }

  int get total {
    return state.length;
  }

  int get adult {
    return state
        .where(
          (e) => e.formType == FormType.adult || e.formType == FormType.obesity,
        )
        .length;
  }

  int get pediatrics {
    return state
        .where(
          (e) => e.formType == FormType.pediatrics,
        )
        .length;
  }

  @override
  void onInit() {
    super.onInit();
    patientFirestoreService.getAll().then(
      (value) {
        for (var patient in value['patients'] as List<Patient>) {
          state.add(patient.copyWith());
        }
        for (var id in value['ids'] as List<String>) {
          ids.add(id);
        }
        update();
      },
    );
  }
}

class PatientStateController extends GetxController {
  Patient? state;
  String? id;
  // getter
  Gender? get gender {
    return state?.gender;
  }

  int? get age {
    return state?.age;
  }

  double? get bodyWeight {
    return state?.bodyWeight;
  }

  double? get height {
    return state?.height;
  }

  double? get bMI {
    return state?.bMI;
  }

  String? get diagnosis {
    return state?.diagnosis;
  }

  String? get operation {
    return state?.operation;
  }

  DateTime? get dateOfOperation {
    return state?.dateOfOperation;
  }

  Physician? get physician {
    return state?.physician;
  }

  PediatricsEvaluation? get pediatricsEvaluation {
    return state?.pediatricsEvaluation;
  }

  AdultEvaluation? get adultEvaluation {
    return state?.adultEvaluation;
  }

  ObesityEvaluation? get obesityEvaluation {
    return state?.obesityEvaluation;
  }

  setId(String newId) {
    id = newId;
    update();
  }

  setState(Patient newState) {
    state = newState.copyWith();
    update();
  }

  setPediatricsEval(PediatricsEvaluation pedEval) {
    state = state!.copyWith(pediatricsEvaluation: pedEval.copyWith());
    update();
  }

  setAdultEval(AdultEvaluation adultEval) {
    state = state!.copyWith(adultEvaluation: adultEval.copyWith());
    update();
  }

  setObesityEval(ObesityEvaluation obesityEval) {
    state = state!.copyWith(obesityEvaluation: obesityEval.copyWith());
    update();
  }

  clear() {
    state = null;
    update();
  }
}

class PhysicientStateController extends GetxController {
  Physician? state;

  setState(Physician newState) {
    state = newState;
    update();
  }
}

class PedEvalStateController extends GetxController {
  // pediatric
  PediatricsEvaluation? state;

  setState(PediatricsEvaluation newState) {
    state = newState;
    update();
  }

  setConsult(String consult) {
    state = state!.copyWith(consult: consult);
    update();
  }

  setPostOperativeICU(bool answer) {
    state = state!.copyWith(isPostOperativeICU: answer);
  }

  setOnedaySurgery(bool answer) {
    state = state!.copyWith(isOneDaySurgery: answer);
  }

  clear() {
    state = null;
  }
}

class AdultEvalStateController extends GetxController {
  AdultEvaluation? state;

  setState(AdultEvaluation newState) {
    state = newState;
    update();
  }

  clear() {
    state = null;
  }
}

class ObesityEvalStateController extends GetxController {
  ObesityEvaluation? state;

  setState(ObesityEvaluation newState) {
    state = newState;
    update();
  }

  clear() {
    state = null;
  }
}

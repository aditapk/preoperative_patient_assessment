import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/screens/adult_evaluation/constant_condition.dart';

import '../models/check_list_data_model.dart';

class CardiovascularSystemController extends GetxController {
  var state = AdultCondition().cardiovascularSystemCondition;

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }
}

class RespiratorySystemController extends GetxController {
  var state = AdultCondition().respiratorySystemCondition;

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }
}

class NeurologicSystemController extends GetxController {
  var state = AdultCondition().neurologicSystemCondition;

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }
}

class RenalSystemController extends GetxController {
  var state = AdultCondition().renalSystemCondition;

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }
}

class EndocrineSystemController extends GetxController {
  var state = AdultCondition().endocrineSystemCondition;

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }
}

class HematologicSystemController extends GetxController {
  var state = AdultCondition().hematologicSystemCondition;

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }
}

class HepatobiliaryController extends GetxController {
  var state = AdultCondition().hepatobilitySystemCondition;

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }
}

class OtherSystemController extends GetxController {
  var state = AdultCondition().otherSystemCondition;

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }
}

class MedicationController extends GetxController {
  var state = AdultCondition().medicationCondition;

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }
}

class HighriskProcedureController extends GetxController {
  bool? state;

  set(bool newState) {
    state = newState;
    update();
  }

  bool get getState {
    return state ?? false;
  }

  bool copy() {
    return state ?? false;
  }

  clear() {
    state = null;
  }
}

class OneDaySurgeryController extends GetxController {
  bool? state;

  set(bool newState) {
    state = newState;
    update();
  }

  bool get getState {
    return state ?? false;
  }

  bool copy() {
    return state ?? false;
  }

  clear() {
    state = null;
  }
}

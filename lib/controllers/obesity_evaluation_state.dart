import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/screens/obesity_evaluation/constant_condition.dart';

import '../models/check_list_data_model.dart';

class ObesityCardiovascularSystemController extends GetxController {
  var state = ObesityCondition().cardiovascularSystemCondition;

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

class ObesityRespiratorySystemController extends GetxController {
  var state = ObesityCondition().respiratorySystemCondition;

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

class ObesityOtherAbnormalConditionController extends GetxController {
  var state = ObesityCondition().otherAbnormalConditions;

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

class StopBANGScoreController extends GetxController {
  var state = ObesityCondition().stopBANGScoreCondition;

  int get score {
    return state
        .where(
          (element) => element.check,
        )
        .length;
  }

  String get level {
    if (score <= 2) {
      return 'Low';
    } else if (score > 2 && score <= 4) {
      return 'Intermediate';
    } else {
      return 'High';
    }
  }

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

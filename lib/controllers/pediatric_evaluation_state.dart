import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';
import 'package:preoperative_patient_assessment/screens/pediatrics_evaluation/constant_condition.dart';

class CVSConditionController extends GetxController {
  var state = PediatricsCondition().cvsCondition;

  setState(List<CheckListDataModel> newState) {
    for (var ch in newState) {
      if (ch.check == true) {
        change(ch.title, ch.check);
      }
    }
    update();
  }

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    clear(); // clear to false state
  }
}

class RSCondictionController extends GetxController {
  var state = PediatricsCondition().rsCondition;

  setState(List<CheckListDataModel> newState) {
    for (var ch in newState) {
      if (ch.check == true) {
        change(ch.title, ch.check);
      }
    }
    update();
  }

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    clear(); // clear to false state
  }
}

class CNSConditionController extends GetxController {
  var state = PediatricsCondition().cnsCondition;

  setState(List<CheckListDataModel> newState) {
    for (var ch in newState) {
      if (ch.check == true) {
        change(ch.title, ch.check);
      }
    }
    update();
  }

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    clear(); // clear to false state
  }
}

class EndocrineConditionController extends GetxController {
  var state = PediatricsCondition().endocrineCondition;

  setState(List<CheckListDataModel> newState) {
    for (var ch in newState) {
      if (ch.check == true) {
        change(ch.title, ch.check);
      }
    }
    update();
  }

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    clear(); // clear to false state
  }
}

class HematoConditionController extends GetxController {
  var state = PediatricsCondition().hematoCondition;

  setState(List<CheckListDataModel> newState) {
    for (var ch in newState) {
      if (ch.check == true) {
        change(ch.title, ch.check);
      }
    }
    update();
  }

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    clear(); // clear to false state
  }
}

class OtherConditionController extends GetxController {
  var state = PediatricsCondition().otherCondition;

  setState(List<CheckListDataModel> newState) {
    for (var ch in newState) {
      if (ch.check == true) {
        change(ch.title, ch.check);
      }
    }
    update();
  }

  change(title, value) {
    state[indexOf(title)].check = value;
    update();
  }

  List<CheckListDataModel> copy() {
    return state
        .map(
          (e) => CheckListDataModel(title: e.title, check: e.check),
        )
        .toList();
  }

  // helping function
  indexOf(title) {
    return state.indexWhere(
      (element) => element.title == title,
    );
  }

  clear() {
    for (var e in state) {
      e.check = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    clear(); // clear to false state
  }
}

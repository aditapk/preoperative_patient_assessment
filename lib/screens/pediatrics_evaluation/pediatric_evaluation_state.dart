import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/screens/pediatrics_evaluation/constant_condition.dart';

class CVSConditionController extends GetxController {
  var state = PediatricsCondition.cvsCondition;

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
}

class RSCondictionController extends GetxController {
  var state = PediatricsCondition.rsCondition;

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
}

class CNSConditionController extends GetxController {
  var state = PediatricsCondition.cnsCondition;

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
}

class EndocrineConditionController extends GetxController {
  var state = PediatricsCondition.endocrineCondition;

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
}

class HematoConditionController extends GetxController {
  var state = PediatricsCondition.hematoCondition;

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
}

class OtherConditionController extends GetxController {
  var state = PediatricsCondition.otherCondition;

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
}
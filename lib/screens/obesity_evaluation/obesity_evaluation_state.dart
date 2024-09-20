import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/screens/obesity_evaluation/constant_condition.dart';

class CardiovascularSystemController extends GetxController {
  var state = ObesityCondition.cardiovascularSystemCondition;

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

class RespiratorySystemController extends GetxController {
  var state = ObesityCondition.respiratorySystemCondition;

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

class OtherAbnormalConditionController extends GetxController {
  var state = ObesityCondition.otherAbnormalConditions;

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

class StopBANGScoreController extends GetxController {
  var state = ObesityCondition.stopBangScoreCondition;

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
}

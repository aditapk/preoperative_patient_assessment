import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/screens/adult_evaluation/constant_condition.dart';

class CardiovascularSystemController extends GetxController {
  var state = AdultCondition.cardiovascularSystemCondition;

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
  var state = AdultCondition.respiratorySystemCondition;

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

class NeurologicSystemController extends GetxController {
  var state = AdultCondition.neurologicSystemCondition;

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

class RenalSystemController extends GetxController {
  var state = AdultCondition.renalSystemCondition;

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

class EndocrineSystemController extends GetxController {
  var state = AdultCondition.endocrineSystemCondition;

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

class HematologicSystemController extends GetxController {
  var state = AdultCondition.hemotologicSystemCondition;

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

class HepatobiliaryController extends GetxController {
  var state = AdultCondition.hepatobilitySystemCondition;

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

class OtherSystemController extends GetxController {
  var state = AdultCondition.otherSystemCondition;

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

class MedicationController extends GetxController {
  var state = AdultCondition.medicationCondition;

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

class HighriskProcedureController extends GetxController {
  bool? state;

  set(bool newState) {
    state = newState;
    update();
  }
}

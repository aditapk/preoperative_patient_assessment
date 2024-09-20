import 'package:get/get.dart';

import '../models/physician_information_model.dart';

class PhysicianInformationGetx extends GetxController {
  PhysicianInformation? physicianInformation;

  updatePhysicianInformation(PhysicianInformation phcInfo) {
    physicianInformation ??= phcInfo;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:preoperative_patient_assessment/constant.dart';

class PatientInformation {
  Gender gender; // enum
  int age;
  double bodyWeight;
  double height;
  double bMI;
  String diagnosis;
  String operation;
  DateTime dateOfOperation;

  PatientInformation({
    required this.gender,
    required this.age,
    required this.bodyWeight,
    required this.height,
    required this.bMI,
    required this.diagnosis,
    required this.operation,
    required this.dateOfOperation,
  });

  PatientInformation copy() {
    return PatientInformation(
        gender: gender,
        age: age,
        bodyWeight: bodyWeight,
        height: height,
        bMI: bMI,
        diagnosis: diagnosis,
        operation: operation,
        dateOfOperation: dateOfOperation);
  }

  @override
  String toString() {
    return 'PatientInformation(gender: $gender, age: $age, bodyWeight: $bodyWeight, height: $height, bMI: $bMI, dianosis: $diagnosis, operation: $operation, dateOfOperation: $dateOfOperation)';
  }
}

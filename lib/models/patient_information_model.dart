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


class Patient {
  Gender gender; // enum
  int age;
  double bodyWeight;
  double height;
  double bMI;
  String diagnosis;
  String operation;
  DateTime dateOfOperation;

  Patient({
    required this.gender,
    required this.age,
    required this.bodyWeight,
    required this.height,
    required this.bMI,
    required this.diagnosis,
    required this.operation,
    required this.dateOfOperation,
  });

  Patient copy() {
    return Patient(
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
    return 'Patient(gender: $gender, age: $age, bodyWeight: $bodyWeight, height: $height, bMI: $bMI, dianosis: $diagnosis, operation: $operation, dateOfOperation: $dateOfOperation)';
  }

  Patient copyWith({
    Gender? gender,
    int? age,
    double? bodyWeight,
    double? height,
    double? bMI,
    String? diagnosis,
    String? operation,
    DateTime? dateOfOperation,
  }) {
    return Patient(
      gender: gender ?? this.gender,
      age: age ?? this.age,
      bodyWeight: bodyWeight ?? this.bodyWeight,
      height: height ?? this.height,
      bMI: bMI ?? this.bMI,
      diagnosis: diagnosis ?? this.diagnosis,
      operation: operation ?? this.operation,
      dateOfOperation: dateOfOperation ?? this.dateOfOperation,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';

import 'package:preoperative_patient_assessment/constant.dart';
import 'package:preoperative_patient_assessment/models/adult_evaluation_model.dart';
import 'package:preoperative_patient_assessment/models/obesity_evaluation_model.dart';

import 'pediatrics_evaluation_model.dart';
import 'physician_information_model.dart';

enum FormType { pediatrics, adult, obesity }

class Patient {
  Gender gender; // enum
  int age;
  double bodyWeight;
  double height;
  double bMI;
  String diagnosis;
  String operation;
  DateTime dateOfOperation;
  Physician physician;
  PediatricsEvaluation? pediatricsEvaluation;
  AdultEvaluation? adultEvaluation;
  ObesityEvaluation? obesityEvaluation;

  FormType get formType {
    if (age < 15) {
      return FormType.pediatrics;
    } else {
      if (bMI < 30) {
        return FormType.adult;
      } else {
        return FormType.obesity;
      }
    }
  }

  dynamic get evaluation {
    if (formType == FormType.pediatrics) {
      return pediatricsEvaluation;
    } else if (formType == FormType.adult) {
      return adultEvaluation;
    } else {
      return obesityEvaluation;
    }
  }

  String get patientType {
    if (formType == FormType.pediatrics) {
      return "pediatrics";
    } else if (formType == FormType.adult) {
      return "adult";
    } else {
      return "obesity";
    }
  }

  Patient({
    required this.gender,
    required this.age,
    required this.bodyWeight,
    required this.height,
    required this.bMI,
    required this.diagnosis,
    required this.operation,
    required this.dateOfOperation,
    required this.physician,
    this.pediatricsEvaluation,
    this.adultEvaluation,
    this.obesityEvaluation,
  });

  @override
  String toString() {
    return 'Patient(gender: $gender, age: $age, bodyWeight: $bodyWeight, height: $height, bMI: $bMI, diagnosis: $diagnosis, operation: $operation, dateOfOperation: $dateOfOperation, physician: $physician, pediatricsEvaluation: $pediatricsEvaluation, adultEvaluation: $adultEvaluation, obesityEvaluation: $obesityEvaluation)';
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
    Physician? physician,
    PediatricsEvaluation? pediatricsEvaluation,
    AdultEvaluation? adultEvaluation,
    ObesityEvaluation? obesityEvaluation,
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
      physician: physician ?? this.physician,
      pediatricsEvaluation: pediatricsEvaluation ?? this.pediatricsEvaluation,
      adultEvaluation: adultEvaluation ?? this.adultEvaluation,
      obesityEvaluation: obesityEvaluation ?? this.obesityEvaluation,
    );
  }

  String get genderToString {
    if (gender == Gender.male) {
      return "male";
    } else {
      return "female";
    }
  }

  Gender toGender(String gender) {
    if (gender == "male") {
      return Gender.male;
    } else {
      // female
      return Gender.female;
    }
  }

  Map<String, dynamic> get evaluationToMap {
    if (formType == FormType.pediatrics) {
      return pediatricsEvaluation!.toMap();
    } else if (formType == FormType.adult) {
      return adultEvaluation!.toMap();
    } else {
      // FormType.obesity
      return obesityEvaluation!.toMap();
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gender': genderToString,
      'age': age,
      'body_weight': bodyWeight,
      'height': height,
      'BMI': bMI,
      'diagnosis': diagnosis,
      'operation': operation,
      'operating_data':
          DateFormat('dd/MM/yyyy').format(dateOfOperation).toString(),
      'physician': physician.toMap(),
      'evaluation': {
        "type": patientType,
        "value": evaluationToMap,
      }
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    // gender
    late Gender genderValue;
    if (map['gender'] as String == "male") {
      genderValue = Gender.male;
    } else {
      // female
      genderValue = Gender.female;
    }

    String evaluationType = map['evaluation']['type'];

    return Patient(
      gender: genderValue,
      age: map['age'] as int,
      bodyWeight: map['body_weight'] as double,
      height: map['height'] as double,
      bMI: map['BMI'] as double,
      diagnosis: map['diagnosis'] as String,
      operation: map['operation'] as String,
      dateOfOperation: DateFormat("dd/MM/yyy").parse(map['operating_data']),
      physician: Physician.fromMap(map['physician'] as Map<String, dynamic>),
      pediatricsEvaluation: evaluationType == 'pediatrics'
          ? PediatricsEvaluation.fromMap(
              map['evaluation']['value'] as Map<String, dynamic>)
          : null,
      adultEvaluation: evaluationType == 'adult'
          ? AdultEvaluation.fromMap(
              map['evaluation']['value'] as Map<String, dynamic>)
          : null,
      obesityEvaluation: evaluationType == 'obesity'
          ? ObesityEvaluation.fromMap(
              map['evaluation']['value'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) =>
      Patient.fromMap(json.decode(source) as Map<String, dynamic>);
}

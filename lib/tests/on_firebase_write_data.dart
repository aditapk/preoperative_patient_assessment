import 'package:flutter/material.dart';
import 'package:preoperative_patient_assessment/constant.dart';
import 'package:preoperative_patient_assessment/models/obesity_evaluation_model.dart';
import 'package:preoperative_patient_assessment/models/physician_information_model.dart';
import 'package:preoperative_patient_assessment/screens/obesity_evaluation/constant_condition.dart';
import 'package:preoperative_patient_assessment/services/patient_firestore_service.dart';

import '../models/patient_information_model.dart';

class WriteDataOnFirebase extends StatefulWidget {
  const WriteDataOnFirebase({super.key});

  @override
  State<WriteDataOnFirebase> createState() => _WriteDataOnFirebaseState();
}

class _WriteDataOnFirebaseState extends State<WriteDataOnFirebase> {
  late Patient patient;
  var service = PatientFirestoreService();
  TextEditingController idController = TextEditingController();
  @override
  void initState() {
    super.initState();

    patient = Patient(
      gender: Gender.male,
      age: 15,
      bMI: 30,
      bodyWeight: 50,
      height: 170,
      dateOfOperation: DateTime.now(),
      diagnosis: "diagnosis test adult",
      operation: "operation test adult",
      physician: Physician(
          name: "physicien name", department: "ENT", phoneNumber: "00005555"),
      // adultEvaluation: AdultEvaluation(
      //     cardiovascularSystem: AdultCondition.cardiovascularSystemCondition,
      //     respiratorySystem: AdultCondition.respiratorySystemCondition,
      //     neurologicSystem: AdultCondition.neurologicSystemCondition,
      //     renalSystem: AdultCondition.renalSystemCondition,
      //     endocrineSystem: AdultCondition.endocrineSystemCondition,
      //     hematologicSystem: AdultCondition.hematologicSystemCondition,
      //     hepatobiliarySystem: AdultCondition.hepatobilitySystemCondition,
      //     othersSystem: AdultCondition.otherSystemCondition,
      //     medication: AdultCondition.medicationCondition,
      //     highriskProcedure: true,
      //     onedaySurgery: true,
      //     consult: "SPAC",
      //     labs: ['LAB1', 'LAB2', 'LAB3']),
      // pediatricsEvaluation: PediatricsEvaluation(
      //   cns: PediatricsCondition.cnsCondition,
      //   cvs: PediatricsCondition.cvsCondition,
      //   endocrine: PediatricsCondition.endocrineCondition,
      //   hemato: PediatricsCondition.hematoCondition,
      //   other: PediatricsCondition.otherCondition,
      //   rs: PediatricsCondition.rsCondition,
      //   consult: "MED",
      //   isOneDaySurgery: true,
      //   isPostOperativeICU: true,
      // ),
      obesityEvaluation: ObesityEvaluation(
          cardiovascularSystem: ObesityCondition().cardiovascularSystemCondition,
          respiratorySystem: ObesityCondition().respiratorySystemCondition,
          stopBANGCondition: ObesityCondition().stopBANGScoreCondition,
          otherAbnormalConditions: ObesityCondition().otherAbnormalConditions,
          consult: "SPAC",
          labs: ['LAB1', 'LAB2', 'LAB3']),
    );
    // Obesity
    patient.obesityEvaluation!.cardiovascularSystem[0].check = true;
    patient.obesityEvaluation!.respiratorySystem[0].check = true;
    patient.obesityEvaluation!.stopBANGCondition[0].check = true;
    patient.obesityEvaluation!.otherAbnormalConditions[0].check = true;
    // patient.pediatricsEvaluation!.cns[0].check = true;
    // patient.pediatricsEvaluation!.cvs[0].check = true;
    // patient.pediatricsEvaluation!.endocrine[0].check = true;
    // patient.pediatricsEvaluation!.hemato[0].check = true;
    // patient.pediatricsEvaluation!.rs[0].check = true;
    // patient.pediatricsEvaluation!.other[1].check = true;
    // patient.pediatricsEvaluation!.comment = "some comment";
    // patient.adultEvaluation!.cardiovascularSystem[0].check = true;
    // patient.adultEvaluation!.respiratorySystem[0].check = true;
    // patient.adultEvaluation!.neurologicSystem[0].check = true;
    // patient.adultEvaluation!.renalSystem[0].check = true;
    // patient.adultEvaluation!.endocrineSystem[0].check = true;
    // patient.adultEvaluation!.hematologicSystem[0].check = true;
    // patient.adultEvaluation!.hepatobiliarySystem[0].check = true;
    // patient.adultEvaluation!.othersSystem[0].check = true;
    // patient.adultEvaluation!.medication[0].check = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write Data on Firebase'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () async {
              // firebase instance
              var id = await service.post(patient);
              print(id);
            },
            child: const Text('Write'),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  var id = idController.text;
                  // firebase instance
                  Patient p = await service.getById(id);
                  print(p);
                },
                child: const Text('Get by ID'),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  controller: idController,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                var map = await service.getAll();
                print(map['patients']);
                print(map['ids']);
              },
              child: const Text('Get All'))
        ],
      ),
    );
  }
}

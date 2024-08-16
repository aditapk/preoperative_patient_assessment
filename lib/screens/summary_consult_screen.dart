import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/screens/registration_screen.dart';
import 'package:preoperative_patient_assessment/widgets/custom_header_widget.dart';

class SummaryConsultScreen extends StatefulWidget {
  const SummaryConsultScreen({super.key});

  @override
  State<SummaryConsultScreen> createState() => _SummaryConsultScreenState();
}

class _SummaryConsultScreenState extends State<SummaryConsultScreen> {
  PatientInformationController controller =
      Get.find<PatientInformationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              controller.criteriaForPreOperativeConsultation.summary =
                  "Consult PED";
              controller.addCriteriaForPreOperativeConsultation();

              // go to registeration no. xxx
              Get.to(() => const RegistrationScreen());
            },
            child: const Text(
              'Finish',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: CustomHeaderWidget(
            leading: Icons.double_arrow,
            title: 'Consult',
            expandRate: 0.8,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey.shade100,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Consult PED',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey.shade300,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: const Text(
                  'ส่งตรวจทางห้องปฏิบัติการตามดุลพินิจของกุมารแพทย์',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

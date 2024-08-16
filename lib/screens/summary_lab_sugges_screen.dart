import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';

import 'package:preoperative_patient_assessment/widgets/custom_header_widget.dart';

import 'registration_screen.dart';

class SummaryLabSuggessionScreen extends StatefulWidget {
  const SummaryLabSuggessionScreen({super.key});

  @override
  State<SummaryLabSuggessionScreen> createState() =>
      _SummaryLabSuggessionScreenState();
}

class _SummaryLabSuggessionScreenState
    extends State<SummaryLabSuggessionScreen> {
  PatientInformationController patientInfoController =
      Get.find<PatientInformationController>();
  List<String> labsuggesList = [];
  @override
  void initState() {
    super.initState();
    labsuggesList = getSummaryLabSuggession();
  }

  List<String> getSummaryLabSuggession() {
    List<String> summaryList = [];
    int patientAge =
        patientInfoController.currentPatientSurgeryInfo!.patientInfo!.age;
    if (patientAge < 15) {
      summaryList =
          patientInfoController.labInvestigration.getOperativePlanListLess15();
    } else if ((patientAge >= 15) && (patientAge <= 45)) {
      summaryList =
          patientInfoController.labInvestigration.getOperativePlanList15To45();
    } else if (patientAge > 45) {
      // age > 45
      summaryList =
          patientInfoController.labInvestigration.getOperativePlanListOver45();
    } else {
      // not support !
      debugPrint('Error : getSummaryLabSuggession');
    }
    summaryList.sort((a, b) => a.compareTo(b));
    return summaryList;
  }

  final List<Color> tableColor = [
    Colors.grey.shade100,
    Colors.grey.shade300,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // add into labinvestigation
              patientInfoController.addLabInvertigration();

              // clear operative lab list
              patientInfoController.labInvestigration.clear();

              // go to registeration no. 1
              Get.off(() => const RegistrationScreen());
            },
            child: const Text(
              'Finish',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: CustomHeaderWidget(
                  leading: Icons.double_arrow,
                  title: 'Laboratory suggession',
                  expandRate: 0.8,
                ),
              ),
              if (labsuggesList.isEmpty)
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: tableColor[0],
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "No need lab",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              else
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: ListView(
                      children: labsuggesList.map((e) {
                        int index = labsuggesList.indexOf(e);
                        return Container(
                          padding: const EdgeInsets.all(10),
                          color: tableColor[index % 2],
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            labsuggesList[index],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

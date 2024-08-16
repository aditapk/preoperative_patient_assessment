import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/screens/tabs/forms_tab_view.dart';
import 'package:preoperative_patient_assessment/screens/tabs/patient_tab_view.dart';

class PatientRegisterationSceen extends StatefulWidget {
  const PatientRegisterationSceen({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<PatientRegisterationSceen> createState() =>
      _PatientRegisterationSceenState();
}

class _PatientRegisterationSceenState extends State<PatientRegisterationSceen> {
  PatientInformationController controller =
      Get.find<PatientInformationController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registeration no. ${widget.index + 1}'),
        ),
        body: Column(
          children: [
            TabBar(
              automaticIndicatorColorAdjustment: false,
              labelColor: Theme.of(context).primaryColor,
              labelStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.grey.shade700,
              indicatorColor: Theme.of(context).primaryColor,
              dividerHeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  child: Text('Patient'),
                ),
                Tab(
                  child: Text('Forms'),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  PatientTabView(
                    patientInformation: controller
                        .patientSurgeryInfos[widget.index].patientInfo!,
                  ),
                  if (controller.patientSurgeryInfos[widget.index]
                          .labInvestigatings.isEmpty &&
                      controller.patientSurgeryInfos[widget.index]
                          .criteriaForPreOperativeConsultation.isEmpty)
                    Center(
                      child: Text(
                        'No form information',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    )
                  else
                    FormsTabView(
                      patientAge: controller
                          .patientSurgeryInfos[widget.index].patientInfo!.age,
                      labInvestigations: controller
                          .patientSurgeryInfos[widget.index].labInvestigatings,
                      criteriaForPreOperativeConsultations: controller
                          .patientSurgeryInfos[widget.index]
                          .criteriaForPreOperativeConsultation,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

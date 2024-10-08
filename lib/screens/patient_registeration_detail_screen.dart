import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/app_state_controller.dart';
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
  var patientsController = Get.find<PatientRegisterStateController>();
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
                    patientInfo: patientsController.state[widget.index],
                  ),
                  FormsTabView(
                    patient: patientsController.state[widget.index],
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

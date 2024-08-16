import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';

import 'package:preoperative_patient_assessment/widgets/card_selection_widget.dart';

import 'neurological_screen.dart';

class RespiratoryScreen extends StatefulWidget {
  const RespiratoryScreen({super.key});

  @override
  State<RespiratoryScreen> createState() => _RespiratoryScreenState();
}

class _RespiratoryScreenState extends State<RespiratoryScreen> {
  List<CheckListDataModel> respiratoryList = [
    CheckListDataModel(
        title:
            'History of severe neonatal respiratory disease (BPD, choronic lung disease)',
        check: false),
    CheckListDataModel(
        title:
            'Uncontrolled pulmonary disease (eg. asthma ที่ได้มีการปรับยาหรือ asthmatic exacerbation ภายใน 3 เดือน)',
        check: false)
  ];
  PatientInformationController controller =
      Get.find<PatientInformationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Respiratory'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: respiratoryList.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 2.5),
                    child: CardSelectionWidget(
                        value: e.check,
                        title: e.title,
                        onChanged: (value) {
                          setState(() {
                            e.check = value!;
                            if (value) {
                              controller.criteriaForPreOperativeConsultation
                                  .respiratory
                                  .add(e.title);
                            } else {
                              controller.criteriaForPreOperativeConsultation
                                  .respiratory
                                  .remove(e.title);
                            }
                          });
                        }),
                  );
                }).toList(),
                //cardiovascularList.map((e) {return CardSelectionWidget(value: e.check, title: e.title, onChanged: (){});}.toList(),
              ),
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Get.to(() => const NeurologicalScreen());
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.keyboard_arrow_right),
                    Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

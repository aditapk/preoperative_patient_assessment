import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';

import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';
import 'package:preoperative_patient_assessment/widgets/card_selection_widget.dart';

import 'endocrine_screen.dart';

class NeurologicalScreen extends StatefulWidget {
  const NeurologicalScreen({super.key});

  @override
  State<NeurologicalScreen> createState() => _NeurologicalScreenState();
}

class _NeurologicalScreenState extends State<NeurologicalScreen> {
  List<CheckListDataModel> neurologicalList = [
    CheckListDataModel(title: 'Craniopharyngioma', check: false),
    CheckListDataModel(
      title:
          'Uncontrolled epilepsy (ได้รับยาชัก 2 กลุ่มขึ้นไป ภายใน 1 ปี ยังไม่มีประวัติชัก)',
      check: false,
    ),
  ];
  PatientInformationController controller =
      Get.find<PatientInformationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neurological'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: neurologicalList.map((e) {
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
                                  .neurological
                                  .add(e.title);
                            } else {
                              controller.criteriaForPreOperativeConsultation
                                  .neurological
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
                  Get.to(() => const EndocrineScreen());
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

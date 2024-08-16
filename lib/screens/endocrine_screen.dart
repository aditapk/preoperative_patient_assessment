import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';

import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';
import 'package:preoperative_patient_assessment/widgets/card_selection_widget.dart';

import 'hematologic_screen.dart';

class EndocrineScreen extends StatefulWidget {
  const EndocrineScreen({super.key});

  @override
  State<EndocrineScreen> createState() => _EndocrineScreenState();
}

class _EndocrineScreenState extends State<EndocrineScreen> {
  List<CheckListDataModel> endocrineList = [
    CheckListDataModel(
        title:
            'Uncontrolled endocrine disorder (eg.\n\u2022 DM\n\u2022 DI\n\u2022 uncontrolled hyperthyroid\n\u2022 Adrenal insufficiency)',
        check: false),
  ];

  final String title = 'Endocrine';
  PatientInformationController controller =
      Get.find<PatientInformationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: endocrineList.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 2.5),
                    child: CardSelectionWidget(
                        value: e.check,
                        title: e.title,
                        onChanged: (value) {
                          setState(() {
                            e.check = value!;
                            if (value) {
                              controller
                                  .criteriaForPreOperativeConsultation.endocrine
                                  .add(e.title);
                            } else {
                              controller
                                  .criteriaForPreOperativeConsultation.endocrine
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
                  Get.to(() => const HematologicScreen());
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

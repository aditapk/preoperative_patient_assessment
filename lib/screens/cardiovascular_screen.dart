// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';

import 'package:preoperative_patient_assessment/models/check_list_data_model.dart';
import 'package:preoperative_patient_assessment/screens/respiratory_screen.dart';
import 'package:preoperative_patient_assessment/widgets/card_selection_widget.dart';

import '../dialogs/confirmation_text_dialog.dart';

class CardioVascularScreen extends StatefulWidget {
  const CardioVascularScreen({super.key});

  @override
  State<CardioVascularScreen> createState() => _CardioVascularScreenState();
}

class _CardioVascularScreenState extends State<CardioVascularScreen> {
  bool? check = false;
  bool cyanoticHeartDiseaseCheck = false;
  List<CheckListDataModel> cardiovascularList = [
    CheckListDataModel(
      title: 'Cyanotic heart disease',
      check: false,
    ),
    CheckListDataModel(
      title:
          'New cardiac abnormalities (eg. \n\u2022 cardiomegaly from chest x-ray \n\u2022 abnormal heart sound)',
      check: false,
    ),
    CheckListDataModel(title: 'Post cardiac surgery in 6 months', check: false),
    CheckListDataModel(title: 'Symptomatic heart failure', check: false),
  ];

  PatientInformationController controller =
      Get.find<PatientInformationController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var result = await Get.dialog(
          ConfirmationTextDialog(
            content: const Text('Are you sure to finish this form?'),
            onCancel: () => Get.back(result: false),
            onOK: () => Get.back(result: true),
          ),
        );

        return result;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cardiovascular'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: ListView(
                    children: cardiovascularList.map((e) {
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
                                      .cardioVascular
                                      .add(e.title);
                                } else {
                                  controller.criteriaForPreOperativeConsultation
                                      .cardioVascular
                                      .remove(e.title);
                                }
                              });
                            }),
                      );
                    }).toList(),
                    //cardiovascularList.map((e) {return CardSelectionWidget(value: e.check, title: e.title, onChanged: (){});}.toList(),
                  ),
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
                    Get.to(() => const RespiratoryScreen());
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
      ),
    );
  }
}

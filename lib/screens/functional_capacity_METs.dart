import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/dialogs/confirmation_text_dialog.dart';
import 'package:preoperative_patient_assessment/dialogs/summary_consult_dialog.dart';
import 'package:preoperative_patient_assessment/screens/registration_screen.dart';
import 'package:preoperative_patient_assessment/screens/severe_underlying_disease_screen.dart';

class FunctionalCapacityMETsScreen extends StatefulWidget {
  const FunctionalCapacityMETsScreen({super.key});

  @override
  State<FunctionalCapacityMETsScreen> createState() =>
      _FunctionalCapacityMETsScreenState();
}

class _FunctionalCapacityMETsScreenState
    extends State<FunctionalCapacityMETsScreen> {
  int metSelect = 0;
  PatientInformationController controller =
      Get.find<PatientInformationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Functional capacity (METs)'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            metSelect = 1; // choose < 4 METs
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: metSelect == 1
                                ? BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 3.0)
                                : BorderSide.none,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '< 4 METs',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('      \u2022 กิจกรรมประจำวัน'),
                                Text('      \u2022 แต่งตัว'),
                                Text('      \u2022 เข้าห้องน้ำ'),
                                Text('      \u2022 เดินประมาณ 100 เมตร')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            metSelect = 2; // choose >= 4 METs
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: metSelect == 2
                                ? BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 3.0)
                                : BorderSide.none,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\u2265 4 METs',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('      \u2022 ขึ้นบันได 2 ขั้น'),
                                Text('      \u2022 เดินขึ้นทางชันๆ ได้'),
                                Text('      \u2022 ทำความสะอาดบ้าน ถูพื้น'),
                                Text('      \u2022 ยกของหนักๆ ได้'),
                                Text(
                                    '      \u2022 เล่นกีฬาที่ค่อนข้างหนักได้ เช่น \n         ว่ายน้ำ ฟุตบอล')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                  onPressed: () async {
                    if (metSelect == 1) {
                      // update METs
                      controller.criteriaForPreOperativeConsultation
                          .functionalCapacity = '< 4 METs';

                      // select on < 4 METs
                      var result = await Get.dialog(
                        ConfirmationTextDialog(
                          content: const Center(
                            child: Text('Are you sure to finish this form?'),
                          ),
                          onOK: () {
                            Get.back(result: true);
                          },
                          onCancel: () {
                            Get.back(result: false);
                          },
                        ),
                      );

                      if (result) {
                        // update summary
                        controller.criteriaForPreOperativeConsultation.summary =
                            'Consult MED';

                        // summary Consult MED
                        Get.dialog(SummaryConsultDialog(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check,
                                color: Theme.of(Get.context!).primaryColor,
                                size: 100,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Consult MED',
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          onOK: () {
                            // update criteria for pre-operative consultation
                            controller.addCriteriaForPreOperativeConsultation();

                            // Go to Registration screen
                            Get.to(() => const RegistrationScreen());
                          },
                        ));
                      }
                    } else if (metSelect == 2) {
                      // update functional selection
                      controller.criteriaForPreOperativeConsultation
                          .functionalCapacity = '\u2265 4 METs';

                      // select on >= 4 METs
                      Get.to(() => const SevereUnderlyingDiseaseScreen());
                    }
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

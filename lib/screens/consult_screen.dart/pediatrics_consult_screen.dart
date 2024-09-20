import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/app_state_controller.dart';

import '../../widgets/custom_header_widget.dart';

class ConsultScreen extends StatelessWidget {
  const ConsultScreen({
    super.key,
    required this.title,
    this.detail,
    this.labs,
    this.fontSize,
  });
  final String title;
  final String? detail;
  final List<String>? labs;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ObesityEvalStateController>();
    print(controller.state);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // todo : Finish action, RECORD data
              // controller.criteriaForPreOperativeConsultation.summary =
              //     "Consult PED";
              // controller.addCriteriaForPreOperativeConsultation();

              // // go to registeration no. xxx
              // Get.to(() => const RegistrationScreen());
            },
            child: const Text(
              'Finish',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: CustomHeaderWidget(
              leading: Icons.double_arrow,
              title: 'Consult',
              expandRate: 0.8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 4)),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize ?? 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                if (detail != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        detail!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                if (labs != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height: 50,
                          child: const Text(
                            'LAB TEST',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Column(
                          children: labs!.map(
                            (e) {
                              int index = labs!.indexOf(e);
                              return Container(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  top: 10,
                                  bottom: 10,
                                  right: 20,
                                ),
                                color: index % 2 == 0
                                    ? Colors.grey.shade300
                                    : Colors.grey.shade100,
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No Lab",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

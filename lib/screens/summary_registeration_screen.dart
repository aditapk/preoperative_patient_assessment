// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:preoperative_patient_assessment/services/patient_firestore_service.dart';

import '../constant.dart';
import '../controllers/app_state_controller.dart';
import '../models/patient_information_model.dart';
import 'patient_information/patient_information_screen.dart';
import 'patient_registeration_detail_screen.dart';

class SummaryRegisterationScreen extends StatefulWidget {
  const SummaryRegisterationScreen({super.key});

  @override
  State<SummaryRegisterationScreen> createState() =>
      _SummaryRegisterationScreenState();
}

class _SummaryRegisterationScreenState
    extends State<SummaryRegisterationScreen> {
  var patients = Get.find<PatientRegisterStateController>();
  var patient = Get.find<PatientStateController>();
  var service = PatientFirestoreService();
  // DateTime currentDate = DateTime.now()
  //     .copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);

  changeDate() async {
    var date = await showDatePicker(
      context: context,
      initialDate: patients.date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
            data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
              primary: Color(0xFF017769),
            )),
            child: child!);
      },
    );
    if (date != null && date.compareTo(patients.date) != 0) {
      patients.updateDate(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: GetBuilder<PatientRegisterStateController>(
                    init: patients,
                    builder: (controller) => HeaderCard(
                      total_no: controller.total,
                      adult_no: controller.adult,
                      pediatrics_no: controller.pediatrics,
                      date: controller.date,
                      onDateChange: () {
                        // todo : select date to display patient registeration
                        print(
                            'todo : select date to display patient registeration');
                        changeDate();
                      },
                    ),
                  ),
                ),
                // Registeration
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 20, right: 20),
                          child: Text(
                            'Registration',
                            style: TextStyle(
                                letterSpacing: 0.8,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            child: GetBuilder<PatientRegisterStateController>(
                              init: patients,
                              builder: (controller) => ListView(
                                children: controller.getPatients.map(
                                  (e) {
                                    int index =
                                        controller.getPatients.indexOf(e);
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        child: RegisterationCard(
                                          index: index,
                                          register: e,
                                        ),
                                        onTap: () {
                                          Get.to(
                                              () => PatientRegisterationSceen(
                                                    index: index,
                                                  ),
                                              routeName:
                                                  'patient-register-information');
                                        },
                                        onDoubleTap: () {
                                          // update current patient edit
                                          patient
                                              .setState(patients.state[index]);
                                          patient.setId(patients.ids[index]);

                                          Get.to(
                                              () =>
                                                  const PatientInformationScreen(
                                                    isEdit: true,
                                                  ),
                                              routeName:
                                                  'patient-information-screen');
                                        },
                                        onLongPress: () async {
                                          bool? result = await Get.defaultDialog(
                                              title: 'Delete',
                                              middleText:
                                                  'Do you want to delete this patient?\nIt will be permanantly deleted from application',
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Get.back(result: true);
                                                  },
                                                  child: const Text('Yes'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Get.back(result: false);
                                                  },
                                                  child: const Text('No'),
                                                ),
                                              ]);
                                          if (result ?? false) {
                                            // delete patient on database
                                            String id = patients.ids[index];
                                            service.deleteWithId(id);

                                            // remove selected patient from register
                                            patients.removeAt(index);
                                          }
                                        },
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () async {
          Get.to(() => const PatientInformationScreen(),
              routeName: 'patient-information');
        },
        child: const Icon(
          Icons.post_add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
    required this.total_no,
    required this.adult_no,
    required this.pediatrics_no,
    required this.date,
    this.onDateChange,
  });

  // PatientInformationController patientInformationController =
  final int total_no;
  final int adult_no;
  final int pediatrics_no;
  final DateTime date;
  final Function()? onDateChange;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onDateChange,
                child: Text(
                  'Today - ${DateFormat('EEE, MMM d, yyyy').format(date)}',
                  style: const TextStyle(
                      letterSpacing: 1.0,
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'Registeration',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 110,
                      child: ToTalCard(
                        number: total_no,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 110,
                      child: Column(children: [
                        Expanded(
                          child: AdultCard(
                            number: adult_no,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        PediatricsCard(
                          number: pediatrics_no,
                        ),
                      ]),
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }
}

class PediatricsCard extends StatelessWidget {
  const PediatricsCard({
    super.key,
    required this.number,
  });

  final int number;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 80,
          child: Column(
            children: [
              Icon(
                Icons.child_care,
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Pediatrics',
                style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor),
            ),
          ),
        )
      ],
    );
  }
}

class AdultCard extends StatelessWidget {
  const AdultCard({
    super.key,
    required this.number,
  });

  final int number;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 80,
          child: Column(
            children: [
              Icon(
                Icons.person,
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Adult',
                style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Center(
            child: Text(
              "$number",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor
                  //Color(0xFF52626F),
                  ),
            ),
          ),
        )
      ],
    );
  }
}

class ToTalCard extends StatelessWidget {
  const ToTalCard({
    super.key,
    required this.number,
  });

  final int number;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Total',
          style: TextStyle(
              letterSpacing: 1.0,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Center(
            child: Text(
              "$number",
              //'${patientInformationController.getTotal()}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor
                  //Color(0xFF52626F),
                  ),
            ),
          ),
        )
      ],
    );
  }
}

class RegisterationCard extends StatelessWidget {
  const RegisterationCard(
      {super.key, required this.register, required this.index});

  final Patient register;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).hoverColor,
            borderRadius: BorderRadius.circular(12)),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: Icon(
                        register.age >= 15 ? Icons.person : Icons.child_care,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BMI: ${register.bMI}, H/B: ${register.height}/${register.bodyWeight}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.local_hospital,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Text(
                                register.operation,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${register.age} years old (${register.gender == Gender.male ? "M" : "F"})',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(Icons.calendar_month),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy')
                                .format(register.dateOfOperation),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
        // Row(
        //   children: [
        //     const SizedBox(
        //       width: 10,
        //     ),
        //     Container(
        //       width: 50,
        //       height: 50,
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: Theme.of(context).primaryColor,
        //       ),
        //       child: Center(
        //         child: Icon(
        //           register.age >= 15 ? Icons.person : Icons.child_care,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child:
        // Padding(
        //         padding: const EdgeInsets.all(10),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             Flexible(
        //               child: Text(
        //                 'BMI: ${register.bMI}, H/B: ${register.height}/${register.bodyWeight}',
        //                 style: const TextStyle(
        //                   fontSize: 14,
        //                   fontWeight: FontWeight.bold,
        //                   overflow: TextOverflow.ellipsis,
        //                 ),
        //               ),
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: [
        //                 Icon(
        //                   Icons.local_hospital,
        //                   color: Theme.of(context).primaryColor,
        //                 ),
        //                 const SizedBox(
        //                   width: 5,
        //                 ),
        //                 Flexible(
        //                   child: Text(
        //                     register.operation,
        //                     style: TextStyle(
        //                         color: Theme.of(context).primaryColor,
        //                         fontWeight: FontWeight.bold),
        //                     overflow: TextOverflow.ellipsis,
        //                   ),
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(10.0),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           Text(
        //             '${register.age} years old (${register.gender == Gender.male ? "M" : "F"})',
        //             style: const TextStyle(
        //                 fontSize: 14, fontWeight: FontWeight.bold),
        //           ),
        //           Row(
        //             children: [
        //               const Icon(Icons.calendar_month),
        //               const SizedBox(
        //                 width: 8,
        //               ),
        //               Text(
        //                 DateFormat('dd/MM/yyyy').format(register.dateOfOperation),
        //                 style: const TextStyle(
        //                     fontSize: 14, fontWeight: FontWeight.bold),
        //               )
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}

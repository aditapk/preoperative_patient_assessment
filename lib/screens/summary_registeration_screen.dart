import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constant.dart';
import '../controllers/patient_information_controller.dart';
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
  PatientInformationController patientInformationController =
      Get.find<PatientInformationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: HeaderCard(),
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
                            child: ListView(
                              children: patientInformationController
                                  .patientSurgeryInfos
                                  .map((e) {
                                int index = patientInformationController
                                        .patientSurgeryInfos
                                        .indexOf(e) +
                                    1; // display index
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      int arrayIndex = index - 1;
                                      Get.to(
                                        () => PatientRegisterationSceen(
                                          index: arrayIndex,
                                        ),
                                      );
                                    },
                                    child: RegisterationCard(
                                      index: index,
                                      register: e.patientInfo!,
                                    ),
                                  ),
                                );
                              }).toList(),
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
              routeName: 'patient-information-screen');
        },
        child: const Icon(
          Icons.post_add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class HeaderCard extends StatefulWidget {
  const HeaderCard({super.key});

  @override
  State<HeaderCard> createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard> {
  PatientInformationController patientInformationController =
      Get.find<PatientInformationController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today - ${DateFormat('EEE, MMM d, yyyy').format(DateTime.now())}',
                style: const TextStyle(
                    letterSpacing: 1.0,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
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
              Row(
                children: [
                  Expanded(
                    child: Column(
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
                              '${patientInformationController.getTotal()}',
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
                    ),
                  ),
                  Expanded(
                    child: Column(children: [
                      Row(
                        children: [
                          const Expanded(
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
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: Center(
                              child: Text(
                                '${patientInformationController.getAdultNo()}',
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
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Expanded(
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
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: Center(
                              child: Text(
                                '${patientInformationController.getPediatricNo()}',
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
                      )
                    ]),
                  )
                ],
              )
            ]),
      ),
    );
  }
}

class RegisterationCard extends StatelessWidget {
  const RegisterationCard(
      {super.key, required this.register, required this.index});

  final PatientInformation register;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).hoverColor,
          borderRadius: BorderRadius.circular(12)),
      width: double.infinity,
      height: 80,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
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
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Reg. no. - $index',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
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
                      Text(
                        register.operation,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${register.age} years old (${register.gender == Gender.male ? "M" : "F"})',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy').format(register.dateOfOperation),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

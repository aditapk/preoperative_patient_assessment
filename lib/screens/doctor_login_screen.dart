import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:preoperative_patient_assessment/controllers/physician_information_controller.dart';
import 'package:preoperative_patient_assessment/main.dart';
import 'package:preoperative_patient_assessment/models/physician_information_model.dart';
import 'package:preoperative_patient_assessment/screens/summary_registeration_screen.dart';
import '../constant.dart';

class DoctorLoginScreen extends StatefulWidget {
  const DoctorLoginScreen({super.key});

  @override
  State<DoctorLoginScreen> createState() => _DoctorLoginScreenState();
}

class _DoctorLoginScreenState extends State<DoctorLoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? selectedDepartment;

  PhysicianInformationGetx physicianInformationGetx =
      Get.put(PhysicianInformationGetx());

  inputValidate() {
    if (nameController.text.isEmpty) {
      return false;
    }
    if (selectedDepartment == null) {
      return false;
    }
    if (phoneNumberController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SizedBox(
          width: 300,
          height: 370,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Physician Information',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        label: Text('Name'), border: OutlineInputBorder()),
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black45, // Border color
                        width: 1.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: DropdownButton(
                      padding: const EdgeInsets.all(8),
                      borderRadius: BorderRadius.circular(8),
                      isExpanded: true,
                      hint: const Text('Department/Divisions'),
                      value: selectedDepartment,
                      items: departments
                          .map(
                            (dep) => DropdownMenuItem(
                              value: dep,
                              child: Text(dep),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDepartment = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    keyboardType: TextInputType.number, // Numeric keyboard
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter
                          .digitsOnly // Allows only digits
                    ],
                    decoration: const InputDecoration(
                        label: Text('Phone Number'),
                        border: OutlineInputBorder()),
                    controller: phoneNumberController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (!inputValidate()) {
                          return;
                        }
                        // update physician information
                        physicianInformationGetx.updatePhysicianInformation(
                          PhysicianInformation(
                            name: nameController.text,
                            department: selectedDepartment,
                            phoneNumber: phoneNumberController.text,
                          ),
                        );

                        // Go to HomePage
                        Get.to(() => const SummaryRegisterationScreen(), routeName: '/homepage');

                        // TODO : if use is not exit add into database
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

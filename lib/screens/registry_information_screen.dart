import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dialogs/confirmation_dialog.dart';

class RegistryInformationScreen extends StatefulWidget {
  const RegistryInformationScreen({super.key});

  @override
  State<RegistryInformationScreen> createState() =>
      _RegistryInformationScreenState();
}

class _RegistryInformationScreenState extends State<RegistryInformationScreen> {
  List<String> departments = [
    'ENT',
    'Eye',
    'Pediatric surgery',
    'Plastic surgery',
    'OB-GYN',
    'General surgery',
    'CVT',
    'Neurosurgery',
    'Orthopedic',
    'Urosurgery',
    'Vascular surgery',
    'Trauma surgery',
    'Medicine',
    'Pediatric',
    'Radiology and Intervention',
    'Rehab',
    'Psychiatrist',
    'Maxillo-facial surgery'
  ];
  String? selectedDepartment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registry Information'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(children: [
            DropdownButton(
              style: const TextStyle(fontSize: 18),
              focusColor: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              value: selectedDepartment,
              isExpanded: true,
              hint: const Text('Select your department'),
              items: departments.map((department) {
                return DropdownMenuItem(
                  value: department,
                  child: Text(
                    department,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDepartment = value;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Get.dialog(const ConfirmationDialog());
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Confirm',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            )
          ]),
        ),
      ),
    );
  }
}

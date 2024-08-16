// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:preoperative_patient_assessment/controllers/patient_information_controller.dart';
import 'package:preoperative_patient_assessment/screens/revised_cardiac_risk_index_screen.dart';
import 'package:preoperative_patient_assessment/screens/underlying_disease_screen.dart';

class SurgeryRisk {
  String surgeryName;
  Risk risk;
  SurgeryRisk({required this.surgeryName, required this.risk});

  @override
  String toString() => 'SurgeryRisk(surgeryName: $surgeryName, risk: $risk)';
}

enum Risk { low, high, intermediate }

class TypeOfSurgeryScreen extends StatefulWidget {
  const TypeOfSurgeryScreen({super.key});

  @override
  State<TypeOfSurgeryScreen> createState() => _TypeOfSurgeryScreenState();
}

class _TypeOfSurgeryScreenState extends State<TypeOfSurgeryScreen> {
  PatientInformationController controller =
      Get.find<PatientInformationController>();

  List<String> surgeryList = [
    'General surgery',
    'Vascular surgery',
    'CVT',
    'Urosurgery',
    'Orthopedic surgery',
    'OB-GYN',
    'Head and neck surgery',
    'Maxillo',
  ];

  String? selectSurgeryType;
  int? caseSelectIndex;

  // General surgery
  List<SurgeryRisk> generalSurgerys = [
    SurgeryRisk(surgeryName: 'Gastroscope/colonoscope', risk: Risk.low),
    SurgeryRisk(surgeryName: 'ERCP', risk: Risk.low),
    SurgeryRisk(surgeryName: 'Breast surgery', risk: Risk.low),
    SurgeryRisk(surgeryName: 'Thyroid', risk: Risk.low),
    SurgeryRisk(
        surgeryName: 'Superficial surgery e.g. skin graft', risk: Risk.low),
    SurgeryRisk(surgeryName: 'Esophagectomy', risk: Risk.high),
    SurgeryRisk(surgeryName: 'Repair perforated bowel', risk: Risk.high),
    SurgeryRisk(surgeryName: 'Adrenal resection', risk: Risk.high),
    SurgeryRisk(
        surgeryName: 'Liver surgery and bile dut surgery', risk: Risk.high),
    SurgeryRisk(surgeryName: 'Duodeno-pancreatic surgery', risk: Risk.high),
    SurgeryRisk(surgeryName: 'Liver transplantation', risk: Risk.high),
    SurgeryRisk(surgeryName: 'Renal transplantation', risk: Risk.intermediate),
    SurgeryRisk(
        surgeryName: 'Other intraperitoneal procedures',
        risk: Risk.intermediate),
    SurgeryRisk(
        surgeryName: 'Head and neck procedure', risk: Risk.intermediate),
  ];
  // Vascular surgery
  List<SurgeryRisk> vascularSurgerys = [
    SurgeryRisk(surgeryName: 'Peripheral angioplasty', risk: Risk.intermediate),
    SurgeryRisk(
        surgeryName: 'Endovascular aneurysmal repair', risk: Risk.intermediate),
    SurgeryRisk(surgeryName: 'Carotid endarterectomy', risk: Risk.intermediate),
    SurgeryRisk(surgeryName: 'Major vascular surgery', risk: Risk.high),
    SurgeryRisk(
        surgeryName:
            'Open lower limb revascularization/thromboembolectomy/amputation',
        risk: Risk.high),
    SurgeryRisk(
        surgeryName: 'Neurosurgery / neurointervention',
        risk: Risk.intermediate),
  ];

  // CVT
  List<SurgeryRisk> cVTs = [
    SurgeryRisk(surgeryName: 'Aortic surgery', risk: Risk.high),
    SurgeryRisk(surgeryName: 'Heart surgery', risk: Risk.high),
    SurgeryRisk(surgeryName: 'Lung surgery', risk: Risk.high),
  ];

  // Urosurgery
  List<SurgeryRisk> urosurgerys = [
    SurgeryRisk(surgeryName: 'Transurethral', risk: Risk.low),
    SurgeryRisk(surgeryName: 'ESWL', risk: Risk.low),
    SurgeryRisk(surgeryName: 'Other minor surgery', risk: Risk.low),
    SurgeryRisk(surgeryName: 'Open nephrectomy', risk: Risk.intermediate),
    SurgeryRisk(
        surgeryName: 'Laparoscopic prostatectomy', risk: Risk.intermediate),
    SurgeryRisk(surgeryName: 'Adrenalectomy', risk: Risk.high),
  ];

  // Orthopedic surgery
  List<SurgeryRisk> orthopedicSurgerys = [
    SurgeryRisk(surgeryName: 'hip surgery', risk: Risk.intermediate),
    SurgeryRisk(surgeryName: 'spine surgery', risk: Risk.intermediate),
    SurgeryRisk(surgeryName: 'Large tumor surgery', risk: Risk.intermediate),
    SurgeryRisk(surgeryName: 'Shoulder surgery', risk: Risk.intermediate),
    SurgeryRisk(surgeryName: 'Other extremity surgery', risk: Risk.low),
  ];

  // OB-GYN
  List<SurgeryRisk> obGYNs = [
    SurgeryRisk(surgeryName: 'Hysteroscopy', risk: Risk.low),
    SurgeryRisk(surgeryName: 'Curettes', risk: Risk.low),
    SurgeryRisk(
        surgeryName: 'Intraperitoneal surgery', risk: Risk.intermediate),
    SurgeryRisk(surgeryName: 'Eye surgery', risk: Risk.low),
  ];

  // Head and neck surgery
  List<SurgeryRisk> headAndNeckSurgerys = [
    SurgeryRisk(surgeryName: 'Thyriod', risk: Risk.low),
    SurgeryRisk(
        surgeryName: 'Other head and neck procedure', risk: Risk.intermediate),
  ];

  // Maxillo
  List<SurgeryRisk> maxillos = [
    SurgeryRisk(surgeryName: 'Dental surgery', risk: Risk.low),
    SurgeryRisk(
        surgeryName: 'Other head and neck procedure', risk: Risk.intermediate),
  ];

  buildSubSurgeryDetail() {
    if (selectSurgeryType != null) {
      if (selectSurgeryType == 'General surgery') {
        return ListView.builder(
          itemCount: generalSurgerys.length,
          itemBuilder: (context, index) {
            SurgeryRisk surgery = generalSurgerys[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  caseSelectIndex = index;
                });
                // set surgery name
                controller.criteriaForPreOperativeConsultation.typeOfSurgery =
                    surgery;
              },
              child: SurgeryCard(
                title: surgery.surgeryName,
                risk: surgery.risk,
                selected:
                    caseSelectIndex != null ? caseSelectIndex == index : false,
              ),
            );
          },
        );
      }
      if (selectSurgeryType! == 'Vascular surgery') {
        return ListView.builder(
          itemCount: vascularSurgerys.length,
          itemBuilder: (context, index) {
            SurgeryRisk surgery = vascularSurgerys[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  caseSelectIndex = index;
                });
                // set surgery name
                controller.criteriaForPreOperativeConsultation.typeOfSurgery =
                    surgery;
              },
              child: SurgeryCard(
                title: surgery.surgeryName,
                risk: surgery.risk,
                selected:
                    caseSelectIndex != null ? caseSelectIndex == index : false,
              ),
            );
          },
        );
      }
      if (selectSurgeryType! == 'CVT') {
        return ListView.builder(
          itemCount: cVTs.length,
          itemBuilder: (context, index) {
            SurgeryRisk surgery = cVTs[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  caseSelectIndex = index;
                });
                // set surgery name
                controller.criteriaForPreOperativeConsultation.typeOfSurgery =
                    surgery;
              },
              child: SurgeryCard(
                title: surgery.surgeryName,
                risk: surgery.risk,
                selected:
                    caseSelectIndex != null ? caseSelectIndex == index : false,
              ),
            );
          },
        );
      }
      if (selectSurgeryType! == 'Urosurgery') {
        return ListView.builder(
          itemCount: urosurgerys.length,
          itemBuilder: (context, index) {
            SurgeryRisk surgery = urosurgerys[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  caseSelectIndex = index;
                });
                // set surgery name
                controller.criteriaForPreOperativeConsultation.typeOfSurgery =
                    surgery;
              },
              child: SurgeryCard(
                title: surgery.surgeryName,
                risk: surgery.risk,
                selected:
                    caseSelectIndex != null ? caseSelectIndex == index : false,
              ),
            );
          },
        );
      }
      if (selectSurgeryType! == 'Orthopedic surgery') {
        return ListView.builder(
          itemCount: orthopedicSurgerys.length,
          itemBuilder: (context, index) {
            SurgeryRisk surgery = orthopedicSurgerys[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  caseSelectIndex = index;
                });
                // set surgery name
                controller.criteriaForPreOperativeConsultation.typeOfSurgery =
                    surgery;
              },
              child: SurgeryCard(
                title: surgery.surgeryName,
                risk: surgery.risk,
                selected:
                    caseSelectIndex != null ? caseSelectIndex == index : false,
              ),
            );
          },
        );
      }
      if (selectSurgeryType! == 'OB-GYN') {
        return ListView.builder(
          itemCount: obGYNs.length,
          itemBuilder: (context, index) {
            SurgeryRisk surgery = obGYNs[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  caseSelectIndex = index;
                });
                // set surgery name
                controller.criteriaForPreOperativeConsultation.typeOfSurgery =
                    surgery;
              },
              child: SurgeryCard(
                title: surgery.surgeryName,
                risk: surgery.risk,
                selected:
                    caseSelectIndex != null ? caseSelectIndex == index : false,
              ),
            );
          },
        );
      }
      if (selectSurgeryType! == 'Head and neck surgery') {
        return ListView.builder(
          itemCount: headAndNeckSurgerys.length,
          itemBuilder: (context, index) {
            SurgeryRisk surgery = headAndNeckSurgerys[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  caseSelectIndex = index;
                });
                // set surgery name
                controller.criteriaForPreOperativeConsultation.typeOfSurgery =
                    surgery;
              },
              child: SurgeryCard(
                title: surgery.surgeryName,
                risk: surgery.risk,
                selected:
                    caseSelectIndex != null ? caseSelectIndex == index : false,
              ),
            );
          },
        );
      }
      if (selectSurgeryType! == 'Maxillo') {
        return ListView.builder(
          itemCount: maxillos.length,
          itemBuilder: (context, index) {
            SurgeryRisk surgery = maxillos[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  caseSelectIndex = index;
                });
                // set surgery name
                controller.criteriaForPreOperativeConsultation.typeOfSurgery =
                    surgery;
              },
              child: SurgeryCard(
                title: surgery.surgeryName,
                risk: surgery.risk,
                selected:
                    caseSelectIndex != null ? caseSelectIndex == index : false,
              ),
            );
          },
        );
      }
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Type of surgery'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Column(children: [
            DropdownButton(
              style: const TextStyle(fontSize: 18),
              focusColor: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              value: selectSurgeryType,
              isExpanded: true,
              hint: const Text('Select surgery type'),
              items: surgeryList.map((surgeryType) {
                return DropdownMenuItem(
                  value: surgeryType,
                  child: Text(
                    surgeryType,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectSurgeryType = value;
                  caseSelectIndex = null;
                });
                // clear surgery name
                controller.criteriaForPreOperativeConsultation.typeOfSurgery =
                    null;
              },
            ),
            Expanded(
              child: buildSubSurgeryDetail(),
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
                    var tTos = controller
                        .criteriaForPreOperativeConsultation.typeOfSurgery;
                    if (tTos != null) {
                      if (tTos.risk == Risk.low ||
                          tTos.risk == Risk.intermediate) {
                        Get.to(() => const UnderlyingDiseaseScreen());
                      } else {
                        // for Hight Risk
                        Get.to(() => const RevisedCardiacRiskIndexScreen());
                      }
                    }
                    // go to next page
                    // Get.dialog(const ConfirmationDialog());
                    // test display surgery name
                    // print(// set surgery name
                    //     controller
                    //         .criteriaForPreOperativeConsultation.typeOfSurgery);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Next',
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

class SurgeryCard extends StatefulWidget {
  const SurgeryCard({
    super.key,
    required this.title,
    required this.risk,
    required this.selected,
  });
  final String title;
  final Risk risk;
  final bool selected;

  @override
  State<SurgeryCard> createState() => _SurgeryCardState();
}

class _SurgeryCardState extends State<SurgeryCard> {
  final Map<Risk, Color> riskColor = {
    Risk.low: Colors.green,
    Risk.intermediate: Colors.orange,
    Risk.high: Colors.red
  };

  final Map<Risk, String> riskString = {
    Risk.low: "Low risk",
    Risk.intermediate: "Intermediate risk",
    Risk.high: "High risk",
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: widget.selected
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side:
                  BorderSide(color: Theme.of(context).primaryColor, width: 3.0))
          : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              riskString[widget.risk]!,
              style: TextStyle(
                color: riskColor[widget.risk],
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

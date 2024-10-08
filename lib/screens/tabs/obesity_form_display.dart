import 'package:flutter/material.dart';
import 'package:preoperative_patient_assessment/models/obesity_evaluation_model.dart';
import 'package:preoperative_patient_assessment/screens/tabs/card_condition_display.dart';

class ObesityFormDisplay extends StatelessWidget {
  const ObesityFormDisplay({super.key, required this.evalState,});
  final ObesityEvaluation evalState;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          // Consult
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 4)),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                evalState.consult,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          if (evalState.labs.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Labs',
                data: evalState.labs,
              ),
            ),
          if (evalState.selectedCardiovascularSystem.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Cardiovascular System',
                data: evalState.selectedCardiovascularSystem,
              ),
            ),
          if (evalState.selectedRespiratorySystem.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Respiratory System',
                data: evalState.selectedRespiratorySystem,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.grey.shade200,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardConditionDisplay(
                      title: 'STOP BANG [ ${evalState.level} risk for OSA ]',
                      data: evalState.selectedSTOPBANGCondition,
                    ),
                  ),
                ),
              ),
            ),
          if (evalState.selectedOtherAbnormalConditions.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Other Abnormal Condition',
                data: evalState.selectedOtherAbnormalConditions,
              ),
            ),
        ],
      ),
    );
  }
}

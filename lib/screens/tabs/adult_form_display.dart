import 'package:flutter/material.dart';
import 'package:preoperative_patient_assessment/models/adult_evaluation_model.dart';
import 'package:preoperative_patient_assessment/screens/tabs/card_condition_display.dart';

class AdultFormDisplay extends StatelessWidget {
  const AdultFormDisplay({
    super.key,
    required this.evalState,
  });

  final AdultEvaluation evalState;

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
              ),
            ),
          if (evalState.selectedNeurologicSystem.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Neurologic System',
                data: evalState.selectedNeurologicSystem,
              ),
            ),
          if (evalState.selectedRenalSystem.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Renal System',
                data: evalState.selectedRenalSystem,
              ),
            ),
          if (evalState.selectedEndocrineSystem.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Endocrine System',
                data: evalState.selectedEndocrineSystem,
              ),
            ),
          if (evalState.selectedHematologicSystem.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Hematologic System',
                data: evalState.selectedHematologicSystem,
              ),
            ),
          if (evalState.selectedHepatobiliarySystem.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Hepatobility System',
                data: evalState.selectedHepatobiliarySystem,
              ),
            ),
          if (evalState.selectedOthersSystem.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Others System',
                data: evalState.selectedOthersSystem,
              ),
            ),
          if (evalState.selectedMedication.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Medication',
                data: evalState.selectedMedication,
              ),
            ),
          if (evalState.highriskProcedure)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'High risk procedure',
                data: ['Yes'],
              ),
            )
          else
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'High risk procedure',
                data: ['No'],
              ),
            ),
          if (evalState.onedaySurgery)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'One day surgery',
                data: ['Yes'],
              ),
            )
          else
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'One day surgery',
                data: ['No'],
              ),
            ),
        ],
      ),
    );
  }
}

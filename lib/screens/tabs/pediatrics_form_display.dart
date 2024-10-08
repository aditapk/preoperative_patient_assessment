import 'package:flutter/material.dart';
import 'package:preoperative_patient_assessment/models/pediatrics_evaluation_model.dart';
import 'package:preoperative_patient_assessment/screens/tabs/card_condition_display.dart';

class PediatricsFormDisplay extends StatelessWidget {
  const PediatricsFormDisplay({
    super.key,
    required this.evalState,
  });

  final PediatricsEvaluation evalState;

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
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 4)),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                evalState.consult!,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          if (evalState.selectedCVS.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'CVS',
                data: evalState.selectedCVS,
              ),
            ),
          if (evalState.selectedRS.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'RS',
                data: evalState.selectedRS,
              ),
            ),
          if (evalState.selectedCNS.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'CNS',
                data: evalState.selectedCNS,
              ),
            ),
          if (evalState.selectedEndocrine.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Endocrine (Uncontrolled conditions)',
                data: evalState.selectedEndocrine,
              ),
            ),
          if (evalState.seletedHemato.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Hemato',
                data: evalState.seletedHemato,
              ),
            ),
          if (evalState.selectedOther.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'Other',
                data: evalState.selectedOther,
                child: evalState.other[1].check
                    ? Container(
                        color: Colors.grey.shade200,
                        width: double.maxFinite,
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 2,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(evalState.comment!),
                          ),
                        ))
                    : null,
              ),
            ),
          if (evalState.isPostOperativeICU != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'the patient need postoperative ICU',
                data: evalState.isPostOperativeICU! ? ['Yes'] : ['No'],
              ),
            ),
          if (evalState.isOneDaySurgery != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardConditionDisplay(
                title: 'the patient is a one-day surgery case',
                data: evalState.isOneDaySurgery! ? ['Yes'] : ['No'],
              ),
            ),
        ],
      ),
    );
  }
}

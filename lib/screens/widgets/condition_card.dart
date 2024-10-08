import 'package:flutter/material.dart';
import 'package:preoperative_patient_assessment/widgets/card_selection_widget.dart';

class ConditionCard extends StatelessWidget {
  const ConditionCard({
    super.key,
    required this.title,
    required this.conditions,
    this.child,
  });
  final String title;
  final List<CardSelectionWidget> conditions;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          padding: const EdgeInsets.only(left: 8),
          alignment: Alignment.centerLeft,
          width: double.maxFinite,
          height: 40,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              border: Border.all(
                width: 2.0,
                color: Theme.of(context).primaryColor,
              )),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Column(
                  children: conditions,
                ),
                child ?? Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

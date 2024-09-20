import 'package:flutter/material.dart';
import 'package:preoperative_patient_assessment/constant.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    required this.value,
    this.onChanged,
  });

  final Gender value;
  final Function(Gender?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: RadioListTile(
            activeColor: Theme.of(context).primaryColor,
            title: Text(
              'Male',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: value == Gender.male ? FontWeight.bold : null,
                  color: value == Gender.male
                      ? Theme.of(context).primaryColor
                      : null),
            ),
            value: Gender.male,
            groupValue: value,
            onChanged: onChanged,
          ),
        ),
        Expanded(
          flex: 2,
          child: RadioListTile(
            activeColor: Theme.of(context).primaryColor,
            title: Text('Female',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: value == Gender.female ? FontWeight.bold : null,
                    color: value == Gender.female
                        ? Theme.of(context).primaryColor
                        : null)),
            value: Gender.female,
            groupValue: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

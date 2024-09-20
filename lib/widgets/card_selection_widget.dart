// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CardSelectionWidget extends StatelessWidget {
  const CardSelectionWidget({
    super.key,
    required this.value,
    required this.title,
    required this.onChanged,
  });
  final bool? value;
  final String title;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: value == true
          ? RoundedRectangleBorder(
              side:
                  BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
              borderRadius: BorderRadius.circular(12))
          : null,
      child: CheckboxListTile(
        activeColor: Theme.of(context).primaryColor,
        contentPadding:
            const EdgeInsets.only(left: 5, top: 1, bottom: 1, right: 5),
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}

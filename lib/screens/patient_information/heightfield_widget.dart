import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preoperative_patient_assessment/screens/widgets/custom_text_field.dart';

class HeightFieldWidget extends StatelessWidget {
  const HeightFieldWidget({
    super.key,
    this.controller,
    this.errorText,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? errorText;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: 'Height',
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(
          decimal: true), // Numeric keyboard with decimal support
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(
            r'^\d*\.?\d*')), // Regular expression to allow only numbers and decimal points
      ],
      errorText: errorText,
      onChanged: onChanged,
    );
  }
}

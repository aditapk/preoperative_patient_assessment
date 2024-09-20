import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preoperative_patient_assessment/screens/widgets/custom_text_field.dart';

class AgeFieldWidget extends StatelessWidget {
  const AgeFieldWidget({
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
      label: "Age",
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly // Allows only digits
      ],
      controller: controller,
      errorText: errorText,
      onChanged: onChanged,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.isSuffixIcon = false,
    this.onSuffix,
    this.controller,
    this.keyboardType,
    this.maxLines,
    this.onChanged,
    this.errorText,
    this.onTap,
    this.readOnly = false,
    this.inputFormatters,
  });
  final String label;
  final bool isSuffixIcon;
  final Function()? onSuffix;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Function(String)? onChanged;
  final String? errorText;
  final Function()? onTap;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        errorText: errorText,
        label: Text(
          label,
        ),
        suffixIcon: isSuffixIcon
            ? IconButton(
                onPressed: onSuffix,
                icon: const Icon(Icons.calendar_month),
              )
            : null,
        suffixIconColor: Theme.of(context).primaryColor,
        floatingLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

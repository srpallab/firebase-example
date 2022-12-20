import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Widget? suffixButton;
  final TextEditingController textEditingController;
  final Function validator;
  final bool hideText;
  final TextInputType textInputType;

  const CustomTextFormField({
    Key? key,
    required this.textEditingController,
    required this.validator,
    required this.label,
    required this.iconData,
    required this.suffixButton,
    required this.hideText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(label),
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: suffixButton,
        ),
        obscureText: hideText,
        keyboardType: textInputType,
        controller: textEditingController,
        validator: (String? value) {
          return validator(value);
        },
        onSaved: (String? value) {},
      ),
    );
  }
}

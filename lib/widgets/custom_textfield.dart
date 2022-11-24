import 'package:flutter/material.dart';

class CustomTextFieldScreen extends StatelessWidget {
  //Creaación de variables que seran recibidas
  final TextInputType? keyboardType;
  final String? hintext;
  final String? initialValue;
  final Widget? prefixIcon;
  final Function(String)? onChange;

  const CustomTextFieldScreen(
      {super.key,
      this.keyboardType,
      this.hintext,
      this.initialValue,
      this.prefixIcon,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChange,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintext,
        prefix: prefixIcon,
        contentPadding: const EdgeInsets.all(8),
      ),
    );
  }
}

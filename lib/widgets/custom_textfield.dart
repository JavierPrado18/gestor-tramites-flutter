import 'package:flutter/material.dart';

class CustomTextFieldScreen extends StatelessWidget {
  //Creaación de variables que seran recibidas
  final TextInputType? keyboardType;
  final String? hintext;
  final String? initialValue;
  final Widget? prefixIcon;
  final Function(String)? onChange;
  final TextEditingController? controller;

  const CustomTextFieldScreen(
      {super.key,
      this.keyboardType,
      this.hintext,
      this.initialValue,
      this.prefixIcon,
      this.onChange,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
        fillColor: Color.fromARGB(192, 255, 255, 255),
        hintText: hintext,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        prefix: prefixIcon,
        contentPadding: const EdgeInsets.all(8),
      ),
    );
  }
}

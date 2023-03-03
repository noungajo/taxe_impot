import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextField buildTextField() {
  return TextField(
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none)),
      hintStyle: const TextStyle(color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.grey),
      labelText: "",
      hintText: "",
    ),
    onChanged: (value) {},
  );
}

TextField buildNumberField() {
  return TextField(
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none)),
      hintStyle: const TextStyle(color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.grey),
      labelText: "",
      hintText: "",
    ),
    controller: TextEditingController(text: ""),
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    onChanged: (value) {},
  );
}

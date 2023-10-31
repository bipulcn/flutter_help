import 'package:flutter/material.dart';

InputDecoration textDecor(String txt, String hint) {
  return InputDecoration(
    labelText: txt,
    hintText: hint,
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  );
}

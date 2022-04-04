import 'package:flutter/material.dart';

TextFormField texformField({required TextEditingController controller,required String hintext}) {
  return TextFormField(
    textInputAction: TextInputAction.next,
    controller:controller,
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: hintext,
    ),
  );
}
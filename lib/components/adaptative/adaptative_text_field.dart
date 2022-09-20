import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final Function(String)? onSubmitted;
  final TextInputType? keyboardType;

  const AdaptativeTextField({
    super.key,
    this.controller,
    this.label,
    this.onSubmitted,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              placeholder: label,
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
            ),
          )
        : TextField(
            keyboardType: keyboardType,
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(labelText: label),
          );
  }
}

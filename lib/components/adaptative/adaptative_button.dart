import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String? label;
  final Function? onPressed;

  const AdaptativeButton({
    super.key,
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: (() => onPressed!),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(label!),
          )
        : OutlinedButton(
            onPressed: () => onPressed!,
            child: Text(label!),
          );
  }
}

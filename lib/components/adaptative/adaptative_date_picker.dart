import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime)? onDateChange;

  const AdaptativeDatePicker({
    this.selectedDate,
    this.onDateChange,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) return;

        onDateChange!(pickedDate);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
            height: 150,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChange!,
            ),
          )
        : SizedBox(
            height: 35,
            child: Row(
              children: [
                Text(
                  selectedDate == null
                      ? 'Nenhuma data selecionada'
                      : DateFormat('dd/MM/y').format(selectedDate!),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  child: const Text(
                    'Selecionar data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => _showDatePicker(context),
                )
              ],
            ),
          );
  }
}

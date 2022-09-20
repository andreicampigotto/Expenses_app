import 'package:flutter/material.dart';
import 'adaptative/adaptative_button.dart';
import 'adaptative/adaptative_text_field.dart';
import 'adaptative/adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.00;

    if (title.isEmpty || value <= 1) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 8.0,
            left: 8.0,
            right: 8.0,
            bottom: 8.0 + mediaQuery.viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: _titleController,
                label: 'Tituto',
              ),
              AdaptativeTextField(
                controller: _valueController,
                label: 'Valor R\$',
                onSubmitted: (_) => _submitForm(),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChange: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    label: 'Adicionar Transação',
                    onPressed: _submitForm,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

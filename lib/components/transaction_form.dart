import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

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

    if (title.isEmpty || value <= 1 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) return;

        setState(
          () {
            _selectedDate = pickedDate;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Tituto',
              ),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _valueController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor R\$',
              ),
            ),
            Container(
              height: 36,
              child: Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'Nenhuma data selecionada'
                        : DateFormat('dd/MM/y').format(_selectedDate),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    child: Text(
                      'Selecionar data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _showDatePicker,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  child: Text(
                    'Adicionar Transação',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: _submitForm,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

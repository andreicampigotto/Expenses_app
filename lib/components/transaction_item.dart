import 'dart:math';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction tr;
  final MediaQueryData mediaQuery;
  final void Function(String p1) onRemove;

  const TransactionItem({
    Key? key,
    required this.tr,
    required this.mediaQuery,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.teal,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.lime,
  ];

  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: FittedBox(
              child: Text(
                'R\$${widget.tr.value}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d/MM/y').format(widget.tr.date),
        ),
        trailing: widget.mediaQuery.size.width > 520
            ? TextButton.icon(
                onPressed: () => widget.onRemove(widget.tr.id),
                icon: Icon(
                  Icons.delete,
                  size: 24,
                  color: Colors.red[900],
                ),
                label: Text(
                  'excluir',
                  style: TextStyle(
                    color: Colors.red[900],
                  ),
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.onRemove(widget.tr.id),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: FittedBox(
              child: Text(
                'R\$${tr.value}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d/MM/y').format(tr.date),
        ),
        trailing: mediaQuery.size.width > 520
            ? TextButton.icon(
                onPressed: () => onRemove(tr.id),
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
                onPressed: () => onRemove(tr.id),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.05),
                SizedBox(
                  height: constraints.maxHeight * 0.1,
                  child: Text(
                    'Nenhuma transação cadastrada!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: ((ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                key: GlobalObjectKey(tr),
                tr: tr,
                mediaQuery: mediaQuery,
                onRemove: onRemove,
              );
            }));
  }
}

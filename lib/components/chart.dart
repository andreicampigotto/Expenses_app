import '/components/chart_bar.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction, {super.key});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool isDay = recentTransaction[i].date.day == weekDay.day;
        bool isMonth = recentTransaction[i].date.month == weekDay.month;
        bool isYear = recentTransaction[i].date.year == weekDay.year;

        if (isDay && isMonth && isYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactions.map((tr) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              label: tr['day'].toString(),
              value: (tr['value'] as double),
              percent: _weekTotalValue == 0
                  ? 0
                  : (tr['value'] as double) / _weekTotalValue,
            ),
          );
        }).toList(),
      ),
    );
  }
}

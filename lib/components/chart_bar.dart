import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String? label;
  final double? value;
  final double? percent;

  ChartBar({
    this.label,
    this.value,
    this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Container(
          height: 25,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'R\$${value?.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12.1,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(5)),
              ),
              FractionallySizedBox(
                heightFactor: percent,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(5)),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          label!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8)
      ],
    );
  }
}

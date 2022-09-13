import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'R\$${value?.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.50,
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
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  label!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12 * MediaQuery.of(context).textScaleFactor,
                  ),
                ),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05)
          ],
        );
      },
    );
  }
}

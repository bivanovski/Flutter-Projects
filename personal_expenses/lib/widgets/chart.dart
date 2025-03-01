import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        // Create a DateTime object without time to compare only the date (day, month, year)
        final transactionDate = recentTransactions[i].date;
        final transactionDateWithoutTime = DateTime(transactionDate.year, transactionDate.month, transactionDate.day);

        // Compare only the day, month, and year
        if (transactionDateWithoutTime == DateTime(weekDay.year, weekDay.month, weekDay.day)) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          height: 200, // Set a fixed height for the chart
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: maxSpending,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index < 0 || index >= groupedTransactionValues.length) {
                        return const Text('');
                      }
                      return Text(
                        groupedTransactionValues[index]['day'] as String,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    },
                    reservedSize: 16,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                // Display the transaction amount above the bars
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index < 0 || index >= groupedTransactionValues.length) {
                        return const Text('');
                      }
                      return Text(
                        '${groupedTransactionValues[index]['amount']}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    },
                    reservedSize: 22,
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: groupedTransactionValues.asMap().map((index, data) {
                return MapEntry(
                  index,
                  BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: (data['amount'] as double),
                        color: Theme.of(context).primaryColor,
                        width: 20,
                      ),
                    ],
                  ),
                );
              }).values.toList(),
            ),
          ),
        ),
      ),
    );
  }
}

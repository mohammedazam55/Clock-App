import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import './ui/styles.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Life is short'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerBuilder.periodic(const Duration(seconds: 1),
                builder: (context) {
              final hr1 = DateTime.now().hour;
              final date = DateTime.now().day;
              final month = DateTime.now().month;
              final year = DateTime.now().year;
              final min = DateTime.now().minute;
              final sec = DateTime.now().second;
              double percentDay =
                  ((DateTime.now().hour / 24) * 100).toDouble().roundToDouble();
              double percentMonth =
                  ((DateTime.now().day / 30) * 100).toDouble().roundToDouble();
              double percentYear = ((DateTime.now().month / 12) * 100)
                  .toDouble()
                  .roundToDouble();
              return Center(
                child: Column(
                  children: [
                    Text(
                      'Time Now - $hr1 : $min : $sec',
                      style: Styles.mainText,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(26.0),
                      child: Text(
                        '$date - $month - $year',
                        style: Styles.mainText,
                      ),
                    ),
                    Text(
                      '$percentDay % of day has gone',
                    ),
                    Text(
                      '$percentMonth % of month has completed',
                    ),
                    Text(
                      '$percentYear % of year has completed',
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

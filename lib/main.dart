import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  double percentYear =
      ((DateTime.now().month / 12) * 100).toDouble().roundToDouble();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Life is short'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Time Now - $hr1 : $min : $sec'),
              Text('$date - $month - $year'),
              Text('$percentDay % of day has gone'),
              Text('$percentMonth % of month has completed'),
              Text('$percentYear % of year has completed'),
            ],
          ),
        ),
      ),
    );
  }
}

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
          backgroundColor: Colors.green,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerBuilder.periodic(
              const Duration(seconds: 1),
              builder: (context) {
                final hr1 = DateTime.now().hour.toString().padLeft(2, '0');
                final date = DateTime.now().day.toString().padLeft(2, '0');
                final month = DateTime.now().month.toString().padLeft(2, '0');
                final year = DateTime.now().year;
                final min = DateTime.now().minute.toString().padLeft(2, '0');
                final sec = DateTime.now().second.toString().padLeft(2, '0');
                final remainHour = (DateTime.now().hour - 23)
                    .toString()
                    .replaceFirst("-", "")
                    .padLeft(2, '0');
                final remainMinute = (DateTime.now().minute - 60)
                    .toString()
                    .replaceFirst("-", "")
                    .padLeft(2, '0');
                final remainSecond = (DateTime.now().second - 60)
                    .toString()
                    .padLeft(2, '0')
                    .replaceFirst("-", "")
                    .padLeft(2, '0');
                double percentMonth = ((DateTime.now().day / 31) * 100)
                    .toDouble()
                    .roundToDouble();
                double percentYear = ((DateTime.now().month / 12) * 100)
                    .toDouble()
                    .roundToDouble();
                double percentDay =
                    ((DateTime.now().hour / 23) * 100).roundToDouble();
                double percentRemainDay =
                    ((23 - DateTime.now().hour) / 23 * 100).roundToDouble();
                return Center(
                  child: Column(
                    children: [
                      Text(
                        "Completed",
                        style: Styles.secondaryText1,
                      ),
                      Text(
                        '$hr1 : $min : $sec',
                        style: Styles.mainText,
                      ),
                      Text(
                        '$percentDay%',
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      const Divider(
                        height: 10.0,
                        thickness: 2.0,
                        color: Colors.grey,
                      ),
                      Text(
                        'Remaining',
                        style: Styles.secondaryText2,
                      ),
                      Text('$remainHour : $remainMinute : $remainSecond',
                          style: Styles.mainText),
                      Text(
                        '$percentRemainDay%',
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      const Divider(
                        height: 10.0,
                        thickness: 2.0,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(26.0),
                        child: Text(
                          '$date-$month-$year',
                          style: Styles.mainText,
                        ),
                      ),
                      Text(
                        '$percentDay % of day has gone',
                        style: Styles.normalText,
                      ),
                      Text(
                        '$percentMonth % of month has completed',
                        style: Styles.normalText,
                      ),
                      Text(
                        '$percentYear % of year has completed',
                        style: Styles.normalText,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

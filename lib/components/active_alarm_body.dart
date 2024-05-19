import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:sous_v/components/alarm_provider.dart';

class ActiveAlarmBody extends StatefulWidget {
  const ActiveAlarmBody({super.key});

  @override
  State<ActiveAlarmBody> createState() => _ActiveAlarmBodyState();
}

class _ActiveAlarmBodyState extends State<ActiveAlarmBody> {
  bool value = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    context.read<AlarmProvider>().inituilize(context);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    context.read<AlarmProvider>().getData();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Text(
              'Alarm List',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ),
        ),
        Consumer<AlarmProvider>(builder: (context, alarm, child) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: alarm.modelist.length,
              itemBuilder: (context, index) {
                DateTime alarmEnd =
                    DateTime.parse(alarm.modelist[index].dateTime!);
                bool isFinished = DateTime.now().millisecondsSinceEpoch <=
                        alarmEnd.millisecondsSinceEpoch
                    ? false
                    : true;
                return Card(
                  child: ListTile(
                    onTap: () {
                      alarm.cancelNotification(alarm.modelist[index].id!);
                    },
                    leading: isFinished
                        ? const Icon(Icons.done, color: Colors.green)
                        : const Icon(
                            Icons.alarm_outlined,
                            color: Colors.red,
                          ),
                    title: Text(
                      DateFormat.yMEd().add_jms().format(alarmEnd),
                    ),
                    subtitle: isFinished
                        ? null
                        : SlideCountdownSeparated(
                            duration: alarmEnd.difference(
                            DateTime.now(),
                          )),
                    trailing: Text(alarm.modelist[index].label ?? ''),
                  ),
                );
              });
        }),
      ],
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width * 0.6,
            alignment: const Alignment(-0.25, 0),
            decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            child: const Text(
              'Alarm List',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Consumer<AlarmProvider>(builder: (context, alarm, child) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: alarm.modelist.length,
              itemBuilder: (context, index) {
                final item = alarm.modelist[index];
                DateTime alarmEnd = DateTime.parse(item.dateTime!);
                bool isFinished = DateTime.now().millisecondsSinceEpoch <=
                        alarmEnd.millisecondsSinceEpoch
                    ? false
                    : true;
                return Card(
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              actionsPadding: const EdgeInsets.all(8),
                              content: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Delete?',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    alarm.cancelNotification(item.id!);
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                  child: const Text(
                                    'Confirm',
                                    style: TextStyle(color: Color(0xFFC21C1C)),
                                  ),
                                )
                              ],
                            );
                          }));
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
                    trailing: Text(item.label ?? ''),
                  ),
                );
              });
        }),
      ],
    );
  }
}

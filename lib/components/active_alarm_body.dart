import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:sous_v/components/alarm_provider.dart';
import 'package:get/get.dart';
import 'package:sous_v/models/alarm_model.dart';

class ActiveAlarmBody extends StatefulWidget {
  const ActiveAlarmBody({super.key});

  @override
  State<ActiveAlarmBody> createState() => _ActiveAlarmBodyState();
}

class _ActiveAlarmBodyState extends State<ActiveAlarmBody> {
  bool value = false;
  late Timer timer;
  late AlarmProvider reader;
  DateTime notificationtime = DateTime.now();
  Random random = Random();

  @override
  void initState() {
    super.initState();
    reader = context.read<AlarmProvider>();
    reader.getData();
    reader.inituilize(context);
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
            constraints: const BoxConstraints(maxWidth: 400),
            alignment: const Alignment(-0.25, 0),
            decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Alarm List',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: showAlarmOption,
                  child: const CircleAvatar(
                      backgroundColor: Colors.white, child: Icon(Icons.add)),
                )
              ],
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
                String part = '';
                bool isEnd = true;
                if (item.part == 1) {
                  isEnd = false;
                  part = '1';
                } else if (item.part == 2) {
                  part = '2';
                }
                return Card(
                  child: ListTile(
                    onTap: () {
                      if (isFinished && !isEnd) {
                        showProceed(alarm, item);
                      } else {
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
                                      style:
                                          TextStyle(color: Color(0xFFC21C1C)),
                                    ),
                                  )
                                ],
                              );
                            }));
                      }
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
                    trailing: isEnd && part != '2'
                        ? Text(item.label ?? '')
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(item.label ?? ''),
                              isFinished
                                  ? const Text('Proceed Part 2?')
                                  : Text('Part $part'),
                            ],
                          ),
                  ),
                );
              });
        }),
      ],
    );
  }

  Future showAlarmOption() async {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text(
                'Select Cooking Method',
                style: TextStyle(fontSize: 18),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    child: ListTile(
                      onTap: () {
                        notificationtime =
                            DateTime.now().add(const Duration(hours: 3));
                        int id = random.nextInt(100);
                        reader.setAlarm('Method A', notificationtime.toString(),
                            true, 1, id);
                        reader.setData();

                        reader.scheduleNotification(notificationtime, id);
                        Navigator.pop(context);
                        Get.snackbar('Success', 'Alarm added',
                            backgroundColor: Colors.white);
                      },
                      title: const Text('Method A:'),
                      subtitle: const Text('Temp: 45°C+60°C, Time: 3h+3h'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        notificationtime =
                            DateTime.now().add(const Duration(hours: 6));
                        int id = random.nextInt(100);
                        reader.setAlarm('Method B', notificationtime.toString(),
                            true, 0, id);
                        reader.setData();
                        reader.scheduleNotification(notificationtime, id);
                        Navigator.pop(context);
                        Get.snackbar('Success', 'Alarm added',
                            backgroundColor: Colors.white);
                      },
                      title: const Text('Method B:'),
                      subtitle: const Text('Temp: 60°C, Time: 6h'),
                    ),
                  ),
                ],
              ),
            )));
  }

  Future showProceed(AlarmProvider alarm, AlarmModel item) async {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text(
                'Start Alarm for Part 2?',
                style: TextStyle(fontSize: 18),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      alarm.cancelNotification(item.id!);
                      Navigator.pop(context);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text(
                      'No, Delete alarm',
                      style: TextStyle(color: Colors.white),
                    )),
                ElevatedButton(
                    onPressed: () {
                      alarm.cancelNotification(item.id!); // delete alarm
                      notificationtime =
                          DateTime.now().add(const Duration(hours: 3));
                      int id = random.nextInt(100);
                      reader.setAlarm(
                          'Method A', notificationtime.toString(), true, 2, id);
                      reader.setData();

                      reader.scheduleNotification(notificationtime, id);
                      Get.snackbar('Success', 'Alarm added',
                          backgroundColor: Colors.white);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text(
                      'Start',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            )));
  }
}

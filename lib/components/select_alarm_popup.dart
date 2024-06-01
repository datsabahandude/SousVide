import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sous_v/components/alarm_provider.dart';

class SelectAlarmPopup {
  static pickMethod(BuildContext context, AlarmProvider reader) {
    DateTime notificationtime = DateTime.now();
    Random random = Random();

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
}

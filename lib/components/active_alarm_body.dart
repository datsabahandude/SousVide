import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sous_v/components/alarm_provider.dart';

class ActiveAlarmBody extends StatefulWidget {
  const ActiveAlarmBody({super.key});

  @override
  State<ActiveAlarmBody> createState() => _ActiveAlarmBodyState();
}

class _ActiveAlarmBodyState extends State<ActiveAlarmBody> {
  bool value = false;
  var timer;

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
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          height: MediaQuery.of(context).size.height * 0.1,
          child: Center(
              child: Text(
            DateFormat.yMEd().add_jms().format(
                  DateTime.now(),
                ),
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          )),
        ),
        Consumer<AlarmProvider>(builder: (context, alarm, child) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
                itemCount: alarm.modelist.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        alarm.modelist[index].dateTime!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                            "|${alarm.modelist[index].label}"),
                                      ),
                                    ],
                                  ),
                                  CupertinoSwitch(
                                      value:
                                          (alarm.modelist[index].milliseconds! <
                                                  DateTime.now()
                                                      .microsecondsSinceEpoch)
                                              ? false
                                              : alarm.modelist[index].check,
                                      onChanged: (v) {
                                        alarm.editSwitch(index, v);

                                        alarm.cancelNotification(
                                            alarm.modelist[index].id!);
                                      }),
                                ],
                              ),
                              Text(alarm.modelist[index].when!)
                            ],
                          ),
                        ),
                      ));
                }),
          );
        }),
      ],
    );
  }
}

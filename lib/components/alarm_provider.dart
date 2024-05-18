import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:intl/intl.dart';
import 'package:sous_v/models/alarm_model.dart';
import 'package:sous_v/screens/homepage.dart';

import 'package:timezone/timezone.dart' as tz;

class AlarmProvider extends ChangeNotifier {
  late SharedPreferences preferences;

  List<AlarmModel> modelist = [];

  List<String> listofstring = [];

  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  late BuildContext context;

  setAlarm(String label, String dateTime, bool check, int id) {
    modelist.add(AlarmModel(
      label: label,
      dateTime: dateTime,
      check: check,
      id: id,
    ));
    notifyListeners();
  }

  editSwitch(int index, bool check) {
    modelist[index].check = check;
    notifyListeners();
  }

  getData() async {
    preferences = await SharedPreferences.getInstance();

    List<String>? cominglist = preferences.getStringList("data");

    if (cominglist == null) {
    } else {
      modelist =
          cominglist.map((e) => AlarmModel.fromJson(json.decode(e))).toList();
      notifyListeners();
    }
  }

  setData() {
    listofstring = modelist.map((e) => json.encode(e.toJson())).toList();
    preferences.setStringList("data", listofstring);

    notifyListeners();
  }

  inituilize(context) async {
    var androidInitilize =
        const AndroidInitializationSettings('@mipmap/launcher_icon');
    var iOSinitilize = const DarwinInitializationSettings();
    var initilizationsSettings =
        InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin!.initialize(initilizationsSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Navigator.push(context,
        MaterialPageRoute<void>(builder: (context) => const HomePage()));
  }

  showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'com.datsabahandude.sous_v',
      'mychannelid',
      importance: Importance.max,
      priority: Priority.max,
      ticker: 'ticker',
    );

    const notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin!.show(
        0, 'plain title', 'plain body', notificationDetails,
        payload: 'item x');
  }

  scheduleNotification(DateTime datetime, int randomNum) async {
    int newtime =
        datetime.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;
    await flutterLocalNotificationsPlugin!.zonedSchedule(
        randomNum,
        'Alarm Clock',
        DateFormat().format(DateTime.now()),
        tz.TZDateTime.now(tz.local).add(Duration(milliseconds: newtime)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
          'com.datsabahandude.sous_v', 'mychannelid',
          // replace default device notification sound
          sound: RawResourceAndroidNotificationSound("alarm"),
          priority: Priority.max,
        )),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  cancelNotification(int notificationid) async {
    // await flutterLocalNotificationsPlugin!.cancel(notificationid);
    preferences = await SharedPreferences.getInstance();
    modelist = [];
    preferences.clear();
  }
}

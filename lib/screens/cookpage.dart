import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sous_v/components/alarm_provider.dart';

class CookPage extends StatefulWidget {
  const CookPage({super.key});

  @override
  State<CookPage> createState() => _CookPageState();
}

class _CookPageState extends State<CookPage> {
  File? image;
  Uint8List? imageBytes;
  bool repeat = false;
  late AlarmProvider reader;
  DateTime notificationtime = DateTime.now();
  Random random = Random();

  int? msec;
  @override
  void initState() {
    super.initState();
    reader = context.read<AlarmProvider>();
    reader.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  notificationtime =
                      DateTime.now().add(const Duration(seconds: 30));
                  int id = random.nextInt(100);
                  reader.setAlarm(
                      '30 secs', notificationtime.toString(), true, id);
                  reader.setData();

                  reader.scheduleNotification(notificationtime, id);
                },
                child: const Text('Demo Alarm within 30 Seconds')),
            ElevatedButton(
                onPressed: () {
                  notificationtime =
                      DateTime.now().add(const Duration(hours: 3));
                  int id = random.nextInt(100);
                  reader.setAlarm(
                      'Method A', notificationtime.toString(), true, id);
                  reader.setData();

                  reader.scheduleNotification(notificationtime, id);
                },
                child: const Text('Temp: 45°C+60°C, Time: 3h+3h')),
            ElevatedButton(
                onPressed: () {
                  notificationtime =
                      DateTime.now().add(const Duration(hours: 6));
                  int id = random.nextInt(100);
                  reader.setAlarm(
                      'Method B', notificationtime.toString(), true, id);
                  reader.setData();

                  reader.scheduleNotification(notificationtime, id);
                },
                child: const Text('Temp: 60°C, Time: 6h')),
          ],
        ),
      ),
    );
  }

  void popup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Choose',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF270E01),
                  )),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    InkWell(
                      splashColor: const Color(0xFF270E01),
                      onTap: _pickImageCamera,
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.camera_alt,
                              color: Color(0xFF270E01),
                            ),
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF270E01),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      splashColor: const Color(0xFF270E01),
                      onTap: _pickImageGallery,
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.image_outlined,
                              color: Color(0xFF270E01),
                            ),
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF270E01),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
  }

  Future _pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      Uint8List imageBytes = await image.readAsBytes();
      final imagetemp = File(image.path);
      setState(() {
        this.image = imagetemp;
        this.imageBytes = imageBytes;
      });
    } on PlatformException catch (e) {
      debugPrint('$e');
      Get.snackbar('Error', 'Something went wrong',
          backgroundColor: Colors.white);
    }
    Get.back();
  }

  Future _pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      Uint8List imageBytes = await image.readAsBytes();
      final imagetemp = File(image.path);
      setState(() {
        this.image = imagetemp;
        this.imageBytes = imageBytes;
      });
    } on PlatformException catch (e) {
      debugPrint('$e');
      Get.snackbar('Error', 'Something went wrong',
          backgroundColor: Colors.white);
    }
    Get.back();
  }
}

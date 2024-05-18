import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:sous_v/components/alarm_provider.dart';

class CookPage extends StatefulWidget {
  const CookPage({super.key});

  @override
  State<CookPage> createState() => _CookPageState();
}

class _CookPageState extends State<CookPage> {
  File? image;
  Uint8List? imageBytes;
  String dateDisplay = '';
  bool repeat = false;
  late AlarmProvider reader;
  DateTime notificationtime = DateTime.now();

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
          children: <Widget>[
            // Stack(
            //   children: [
            //     CircleAvatar(
            //       radius: 102,
            //       backgroundColor: const Color(0xFF270E01),
            //       child: imageBytes != null
            //           ? ClipOval(
            //               child: Image.memory(
            //                 imageBytes!,
            //                 width: 200,
            //                 height: 200,
            //                 fit: BoxFit.cover,
            //               ),
            //             )
            //           : const CircleAvatar(
            //               radius: 100,
            //               backgroundImage:
            //                   AssetImage('assets/images/sousvide.jpg'),
            //               backgroundColor: Colors.white,
            //             ),
            //     ),
            //     Positioned(
            //       right: 10,
            //       bottom: 10,
            //       child: ElevatedButton(
            //           onPressed: () => popup(),
            //           style: ElevatedButton.styleFrom(
            //             shape: const CircleBorder(),
            //           ),
            //           child: const Icon(Icons.add_a_photo_outlined)),
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.3,
            //   width: MediaQuery.of(context).size.width,
            //   child: Center(
            //       child: CupertinoDatePicker(
            //     showDayOfWeek: true,
            //     minimumDate: DateTime.now(),
            //     dateOrder: DatePickerDateOrder.dmy,
            //     onDateTimeChanged: (va) {
            //       dateTime = DateFormat().add_jms().format(va);

            //       msec = va.microsecondsSinceEpoch;

            //       notificationtime = va;

            //       print(dateTime);
            //       print(msec);
            //       print(notificationtime);
            //     },
            //   )),
            // ),
            const SlideCountdownSeparated(
              duration: Duration(minutes: 2),
            ),
            ElevatedButton(
                onPressed: () {
                  notificationtime =
                      DateTime.now().add(const Duration(minutes: 1));
                  dateDisplay =
                      DateFormat('d MMM yyyy HH:mm').format(notificationtime);
                  int id = DateTime.now().millisecondsSinceEpoch;
                  reader.setAlarm('1 minutes', dateDisplay, true, id);
                  reader.setData();

                  reader.scheduleNotification(notificationtime, id);
                },
                child: const Text('Set 1 minute notif')),
            ElevatedButton(
                onPressed: () {
                  notificationtime =
                      DateTime.now().add(const Duration(minutes: 5));
                },
                child: const Text('Set 5 minute notif')),
            ElevatedButton(
                onPressed: () {
                  notificationtime =
                      DateTime.now().add(const Duration(minutes: 10));
                },
                child: const Text('Set 10 minute notif')),
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

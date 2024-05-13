import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:sous_v/api/notification_api.dart';

class CookPage extends StatefulWidget {
  const CookPage({super.key});

  @override
  State<CookPage> createState() => _CookPageState();
}

class _CookPageState extends State<CookPage> {
  File? image;
  Uint8List? imageBytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                CircleAvatar(
                  radius: 102,
                  backgroundColor: const Color(0xFF270E01),
                  child: imageBytes != null
                      ? ClipOval(
                          child: Image.memory(
                            imageBytes!,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              AssetImage('assets/images/sousvide.jpg'),
                          backgroundColor: Colors.white,
                        ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: ElevatedButton(
                      onPressed: () => popup(),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(Icons.add_a_photo_outlined)),
                )
              ],
            ),
            const SlideCountdownSeparated(
              duration: Duration(minutes: 2),
            ),
            ElevatedButton(
                onPressed: () => NotificationApi.showNotification(
                    title: 'Title', body: 'Body', payload: 'Payload'),
                child: const Text('show notif'))
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

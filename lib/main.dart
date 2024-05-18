import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sous_v/components/alarm_provider.dart';
import 'package:sous_v/screens/homepage.dart';

// Future<void> _handleBackgroundMessage(RemoteMessage msg) async {
//   await Firebase.initializeApp();
// }
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .requestNotificationsPermission();
  // await Firebase.initializeApp();
  // await FirebaseMessaging.instance.getInitialMessage();
  // FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  runApp(ChangeNotifierProvider(
    create: (contex) => AlarmProvider(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
  // DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF090080)),
        useMaterial3: true,
        fontFamily: GoogleFonts.manrope().fontFamily,
      ),
      home: const HomePage(),
    );
  }
}

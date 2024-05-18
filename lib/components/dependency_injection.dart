// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DependencyInjection {
//   static void init() {
//     Get.put<AlarmController>(AlarmController(), permanent: true);
//   }
// }
// class AlarmController extends GetxController{

//     @override
//   void onInit() {
//     super.onInit();
//     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }
//   void _updateConnectionStatus(ConnectivityResult connectivityResult) {
//     if (connectivityResult == ConnectivityResult.none) {
//       Get.rawSnackbar(
//           messageText: const Text(
//             'Please Connect to the Internet',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 14,
//             ),
//           ),
//           isDismissible: false,
//           duration: const Duration(days: 1),
//           backgroundColor: Colors.red[400]!,
//           icon: const Icon(
//             Icons.wifi_off_outlined,
//             color: Colors.white,
//             size: 35,
//           ),
//           margin: EdgeInsets.zero,
//           snackStyle: SnackStyle.GROUNDED);
//     } else {
//       if (Get.isSnackbarOpen) {
//         Get.closeCurrentSnackbar();
//       }
//     }
//   }
// }

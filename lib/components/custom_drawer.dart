import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sous_v/screens/stepspage.dart';
import 'package:sous_v/screens/resultpage.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      elevation: 8,
      child: SafeArea(
          child: Stack(
        children: [
          ListView(
            children: <Widget>[
              buildHeader(context),
              buildBody(context),
            ],
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Card(
          //     margin: const EdgeInsets.all(16),
          //     color: Colors.transparent,
          //     child: ListTile(
          //       onTap: () {
          //         FirebaseAuth.instance.signOut();
          //         Get.off(const LoginPage());
          //       },
          //       title: const Text(
          //         'Logout',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       trailing: const Icon(
          //         Icons.exit_to_app_outlined,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // )
        ],
      )),
    );
  }

  Widget buildHeader(context) {
    return CircleAvatar(
      radius: 100,
      backgroundColor: Colors.white,
      child: CircleAvatar(
          radius: 98,
          child: Image.asset(
            'assets/images/app_icon.png',
            fit: BoxFit.fitWidth,
          )),
    );
  }

  Widget buildBody(context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(children: <Card>[
        Card(
          color: Colors.white,
          child: ListTile(
            onTap: () => Get.to(const StepsPage()),
            title: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Start Cooking'),
                Icon(
                  Icons.local_fire_department_sharp,
                  color: Colors.red,
                )
              ],
            ),
            trailing: const Icon(
              Icons.chevron_right_outlined,
              // color: Colors.white,
            ),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () => Get.to(const ResultPage()),
            title: const Text('Cooking Results'),
            trailing: const Icon(
              Icons.chevron_right_outlined,
              // color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}

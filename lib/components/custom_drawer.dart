import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sous_v/screens/cookpage.dart';
import 'package:sous_v/screens/recipepage.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: ,
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
    return const CircleAvatar(
      radius: 100,
      backgroundColor: Colors.white,
      child: CircleAvatar(
          radius: 98,
          backgroundImage: AssetImage(
            'assets/images/app_icon.png',
          )),
    );
  }

  Widget buildBody(context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(children: <Card>[
        Card(
          child: ListTile(
            onTap: () => Get.to(const RecipePage()),
            title: const Text('Recipes'),
            trailing: const Icon(
              Icons.chevron_right_outlined,
              // color: Colors.white,
            ),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () => Get.to(const CookPage()),
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

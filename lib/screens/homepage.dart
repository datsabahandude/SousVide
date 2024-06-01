import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sous_v/components/active_alarm_body.dart';
import 'package:sous_v/components/custom_drawer.dart';
import 'package:sous_v/components/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage("assets/images/sousvide.jpg"), context);
  }

  @override
  Widget build(BuildContext context) {
    final screen = [
      HomeBody(
        onAction: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      const ActiveAlarmBody(),
    ];
    return PopScope(
        canPop: false,
        child: isLoading
            ? Container(
                color: Colors.white,
                alignment: Alignment.center,
                width: double.infinity,
                child: Lottie.asset('assets/lottie/steam1.json'),
              )
            : Scaffold(
                key: _scaffoldKey,
                body: screen[_selectedIndex],
                drawer: const CustomDrawer(),
                bottomNavigationBar: BottomNavigationBar(
                    currentIndex: _selectedIndex,
                    onTap: _onItemTap,
                    backgroundColor: Colors.blueGrey,
                    selectedFontSize: 0,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          label: '',
                          icon: Padding(
                            padding: EdgeInsets.all(12),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.home,
                                color: Colors.blueGrey,
                              ),
                            ),
                          )),
                      BottomNavigationBarItem(
                          label: '',
                          icon: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.alarm,
                              color: Colors.blueGrey,
                            ),
                          )),
                    ])));
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

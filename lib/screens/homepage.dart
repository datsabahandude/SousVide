import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
  final _navigationKey = GlobalKey<CurvedNavigationBarState>();
  final scrollctrl = ScrollController();
  int index = 0;
  int selectedCategoryIndex = 0;
  double infoHeight = 200 // expanded height
      // +
      // 170 // infoheight
      -
      kToolbarHeight;
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
                body: screen[index],
                drawer: const CustomDrawer(),
                bottomNavigationBar: CurvedNavigationBar(
                    key: _navigationKey,
                    height: 60,
                    index: index,
                    color: Colors.blueGrey,
                    backgroundColor: Colors.transparent,
                    animationCurve: Curves.easeInOut,
                    animationDuration: const Duration(milliseconds: 300),
                    onTap: (index) {
                      setState(() {
                        this.index = index;
                      });
                    },
                    items: const [
                      Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.event,
                        color: Colors.white,
                      ),
                    ])));
  }
}

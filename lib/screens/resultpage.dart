import 'package:flutter/material.dart';
import 'package:sous_v/components/result_body.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    // int? currentTab;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: const Text('Result Page'),
            bottom: const TabBar(
                labelColor: Colors.black,
                labelStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: TextStyle(
                  fontSize: 17,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: <Widget>[
                  Tab(
                    child: Text('Method A'),
                  ),
                  Tab(
                    child: Text('Method B'),
                  ),
                ]),
          ),
          body: const TabBarView(
            children: <Widget>[
              ResultBody(),
              ResultBody(),
            ],
          )),
    );
  }
}

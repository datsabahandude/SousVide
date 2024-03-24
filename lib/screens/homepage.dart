import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollctrl = ScrollController();
  int selectedCategoryIndex = 0;
  double infoHeight = 200 // expanded height
      +
      170 // infoheight
      -
      kToolbarHeight;
  bool isLoading = true;
  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;
      for (var i = 0; i < index; i++) {
        // totalItems += CategoryMenus[i].items.length;
        totalItems += 3;
      }
      // 116 = 100 Menu Item Height + 16 bottom padding for each item
      // 50 = 18 title font size + 32 (16 vert padding on title)
      scrollctrl.animateTo(infoHeight + (116 * totalItems) + (50 * index),
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
      setState(() {
        selectedCategoryIndex = index;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage("assets/images/sousvide.jpg"), context);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(),
          body: Stack(
            children: [
              CustomScrollView(
                controller: scrollctrl,
                slivers: [
                  SliverAppBar(
                    expandedHeight: 200,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        "assets/images/sousvide.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    leading: Center(
                      child: MaterialButton(
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        color: Colors.white,
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.list_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 110,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      // child: Column(
                      //   children: [],
                      // ),
                    ),
                  )),
                ],
              )
            ],
          ),
        ));
  }
}

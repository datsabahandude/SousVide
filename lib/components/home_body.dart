import 'package:flutter/material.dart';
import 'package:sous_v/components/categories.dart';
import 'package:sous_v/components/topic_card.dart';
import 'package:sous_v/models/topic.dart';

class HomeBody extends StatefulWidget {
  final Function onAction;
  const HomeBody({super.key, required this.onAction});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final scrollctrl = ScrollController();
  int index = 0;
  int selectedCategoryIndex = 0;
  double infoHeight = 200 // expanded height
      // +
      // 170 // infoheight
      -
      kToolbarHeight;
  bool isLoading = true;

  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;
      for (var i = 0; i < index; i++) {
        totalItems += theTopics[i].topics.length;
        // totalItems += 3;
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
    return Stack(
      children: [
        CustomScrollView(
          controller: scrollctrl,
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              backgroundColor: Colors.blueGrey,
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
                    widget.onAction();
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
            // const SliverToBoxAdapter(
            //     child: SizedBox(
            //   height: 110,
            //   child: Padding(
            //     padding: EdgeInsets.all(16),
            //     child: Column(
            //       children: [],
            //     ),
            //   ),
            // )),
            SliverPersistentHeader(
              delegate: SVCategories(
                  onChanged: scrollToCategory,
                  selectedIndex: selectedCategoryIndex),
              pinned: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, categoryIndex) {
                  List<Topic> items = theTopics[categoryIndex].topics;
                  return TopicCategoryItem(
                    text: theTopics[categoryIndex].category,
                    items: List.generate(
                      items.length,
                      (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TopicCard(
                            text: items[index].text,
                            image: items[index].image,
                            // desc: items[index].desc,
                            // type: items[index].type,
                            // price: items[index].price,
                            // onPressed: () {
                            //   showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) =>
                            //         MenuDialog(
                            //       image: items[index].image,
                            //       toCart: addToCart,
                            //     ),
                            //   );
                            // },
                          )),
                    ),
                  );
                }, childCount: theTopics.length),
              ),
            )
          ],
        )
      ],
    );
  }
}

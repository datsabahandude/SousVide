import 'package:flutter/material.dart';
import 'package:sous_v/components/topic_card.dart';
import 'package:sous_v/models/topic.dart';

class HomeBody extends StatefulWidget {
  final Function onAction;
  const HomeBody({super.key, required this.onAction});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool isLoading = true;

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
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, categoryIndex) {
                  List<Topic> items = theTopics[categoryIndex].topics;
                  return TopicCategoryItem(
                    text: theTopics[categoryIndex].category,
                    items: List.generate(
                      items.length,
                      (index) => TopicCard(
                        text: items[index].text,
                        image: items[index].image,
                      ),
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

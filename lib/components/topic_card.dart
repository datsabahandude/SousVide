import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({super.key, required this.title, this.image});
  final String title;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 15,
      runSpacing: 5,
      children: [
        image != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SizedBox(
                  width: 200,
                  // height: 200,
                  child: Image.asset(
                    image!,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Container(),
        DefaultTextStyle(
          style: const TextStyle(color: Colors.black54),
          child: Text(
            title,
            textAlign: TextAlign.justify,
            // overflow: TextOverflow.ellipsis,
            // maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              letterSpacing: 0.5,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}

class TopicCategoryItem extends StatelessWidget {
  const TopicCategoryItem({
    super.key,
    required this.title,
    required this.items,
  });
  final String title;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ...items,
      ],
    );
  }
}

import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({super.key, required this.text, this.image});
  final String text;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 15,
      runSpacing: 5,
      children: [
        image != null
            ? Image.asset(
                image!,
                fit: BoxFit.cover,
              )
            : Container(),
        Text(
          text,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            letterSpacing: 0.5,
          ),
        )
      ],
    );
  }
}

class TopicCategoryItem extends StatelessWidget {
  const TopicCategoryItem({
    super.key,
    required this.text,
    required this.items,
  });
  final String text;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ...items,
      ],
    );
  }
}

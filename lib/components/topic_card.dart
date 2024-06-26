import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({super.key, required this.text, this.image});
  final String text;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        image != null
            ? Image.asset(
                image!,
                fit: BoxFit.cover,
              )
            : const SizedBox(),
        text == ''
            ? const SizedBox()
            : Text(
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
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

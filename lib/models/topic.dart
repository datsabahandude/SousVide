class Topic {
  final String text;
  String? image;
  Topic({required this.text, this.image});
}

class TopicCategory {
  final String category;
  final List<Topic> topics;
  TopicCategory({required this.category, required this.topics});
}

final List<TopicCategory> theTopics = [
  TopicCategory(
    category: "Sous Vide Know-How",
    topics: [
      Topic(
        text:
            'Sous vide is a cooking method where food is vacuum-sealed in a bag and cooked in a precisely controlled water bath at a low temperature for an extended period. This technique ensures even cooking and helps retain moisture and flavors, resulting in tender and flavorful dishes. It\'s often used for meat, fish, vegetables, and eggs, allowing for precise control over the final texture and doneness of the food.',
        // image: "assets/images/sousvide.jpg",
      )
    ],
  ),
  TopicCategory(
    category: "Things needed to have before starting",
    topics: [
      Topic(
        text: '',
        image: "assets/images/basicSV.jpg",
      )
    ],
  ),
  TopicCategory(
    category: "Overall steps to do",
    topics: [
      Topic(
        text: '',
        image: "assets/images/howSV.jpg",
      )
    ],
  ),
  TopicCategory(
    category: "Tips & Tricks",
    topics: [
      Topic(
        text:
            '1. Double Bagging: Prevents punctures when cooking foods with sharp edges, such as bones.\n2. Securing: Use a clip to attach the bag to the container\'s side to prevent floating.\n3. Finishing: Pat food dry before searing to achieve a superior crust.',
      )
    ],
  ),
  TopicCategory(
    category: "Safety Considerations",
    topics: [
      Topic(
        text:
            '1. Temperature Control: Ensure food is cooked at recommended temperatures to prevent bacterial growth.\n2. Handling: Refrigerate food promptly after cooking if not consuming immediately.\n3. Storage: Sous vide cooked meat can be stored in vacuum-sealed bags for several days in the refrigerator or longer in the freezer.',
      )
    ],
  ),

  // TopicCategory(
  //   category: "Cooking Results",
  //   topics: [
  //     Topic(
  //       text:
  //           'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  //     )
  //   ],
  // ),
  // TopicCategory(
  //   category: "How To",
  //   topics: [
  //     Topic(
  //       text:
  //           'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
  //     )
  //   ],
  // ),
  // TopicCategory(
  //   category: "Machines",
  //   topics: [
  //     Topic(
  //       text:
  //           'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
  //     )
  //   ],
  // ),
  // TopicCategory(
  //   category: "Benefits",
  //   topics: [
  //     Topic(
  //         text:
  //             '1. Precise Temperature Control\n2. Enhanced Flavor Retention\n3. Tender and Juicy Results\n4. Convenience\n5. Reduced Risk of Overcooking')
  //   ],
  // ),
  // TopicCategory(
  //   category: "Drawbacks",
  //   topics: [
  //     Topic(
  //         text:
  //             '1. Time-consuming\n2. Equipment Requirements\n3. Lack of Browning\n4. Texture Concerns\n5. Food Safety Considerations')
  //   ],
  // ),
];

import 'package:flutter/material.dart';

import '../models/cat.dart';

final List<String> replies = [
  "저 근엄한 눈빛!",
  "저 근엄한 눈빛!",
  "저 근엄한 눈빛!",
  "저 근엄한 눈빛!",
  "저 근엄한 눈빛!"
];

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.cat});

  final Cat cat;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        title: Text(widget.cat.title),
      ),

      ///Body
      body: SafeArea(
        child: ListView(
          ///padding
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
          ),

          ///scroll
          physics: const ClampingScrollPhysics(),

          children: [
            ///1. image ratio
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                widget.cat.link,
                fit: BoxFit.cover,
              ),
            ),

            ///2. row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///cat name
                Text(
                  widget.cat.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF777777),
                  ),
                ),
                ///like icon
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.thumb_up_outlined,
                      ),
                      onPressed: () {},
                    ),
                    Text(widget.cat.likeCount.toString())
                  ],
                ),
              ],
            ),

            ///2. text
            Text(
              "댓글 ${widget.cat.replyCount}개",
            ),

            ///3. List.generate
            ...List.generate(
                replies.length,
                (int index) => Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Row(
                    children: [
                      ///user name
                      const Text(
                        "익명",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ///padding left
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.0)),
                      ///replies
                      Text(
                        replies[index],
                      ),
                    ],
                  ),
                ),
            ),

            ///4. padding
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                "${widget.cat.created.year}년 ${widget.cat.created.month}월 ${widget.cat.created.day}일",
                style: const TextStyle(
                  color: Color(0xFFAAAAAA),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

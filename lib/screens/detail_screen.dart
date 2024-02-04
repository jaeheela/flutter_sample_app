import 'package:flutter/material.dart';

import '../models/cat.dart';

final List<String> replies = [
  "저 근엄한 눈빛!",
  "어느 고양이별에서 왔니?",
  "집사로서 주인님께 충성할 뿐...",
  "냥이님 날 가져요~~",
  "왕족 고양이라서 오히려 좋아~!",
  "중요한건 꺾이지 않는 냥미모!",
  "저 근엄한 눈빛!2",
  "어느 고양이별에서 왔니?2",
  "집사로서 주인님께 충성할 뿐...2",
  "냥이님 날 가져요~~2",
  "왕족 고양이라서 오히려 좋아~!2",
  "중요한건 꺾이지 않는 냥미모!2",
];

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.cat});

  final Cat cat;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  /// => 좋아요 누른 유무 (state변수)
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        title: Text(widget.cat.title),
      ),

      ///Body
      body: SafeArea(
        child: Stack(
          children: [
            ///Stack의 첫번째 요소 - ListView()
            ListView(
              ///1. padding
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
              ),

              ///2. scroll
              physics: const ClampingScrollPhysics(),

              ///3. children
              children: [
                ///3-1. image ratio
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    widget.cat.link,
                    fit: BoxFit.cover,
                  ),
                ),

                ///3-2. row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///3-2-1. cat name
                    Text(
                      widget.cat.name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF777777),
                      ),
                    ),
                    ///3-2-2. like icon
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            //Icons.thumb_up
                            isLiked ? Icons.thumb_up : Icons.thumb_up_outlined
                          ),
                          onPressed: (){
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                        ),
                        Text(widget.cat.likeCount.toString())
                      ],
                    ),
                  ],
                ),

                ///3-3. text
                Text(
                  "댓글 ${widget.cat.replyCount}개",
                ),

                ///3-4. List.generate
                ...List.generate(
                    ///3-4-1. 인자1
                    replies.length,
                    ///3-4-2. 인자2
                    (int index) => Padding(
                      ///3-4-2-1. padding
                      padding: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      ///3-4-2-2. child
                      child: Row(
                        children: [
                          ///3-4-2-2-1. user name
                          const Text(
                            "익명",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ///3-4-2-2-2. padding left
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.0)),
                          ///3-4-2-2-3. replies
                          Text(
                            replies[index],
                          ),
                        ],
                      ),
                    ),
                ),

                ///3-5. padding
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

            ///Stack의 두번째 요소 - Align() : 댓글작성 폼
            Align(
              ///1. alignment
              alignment: Alignment.bottomCenter,

              ///2. Padding
              child: Padding(

                ///2-1. padding
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),

                ///2-2. Container
                child: Container(

                  ///2-2-1. padding
                  padding: const EdgeInsets.only(
                    top:10.0,
                  ),

                  ///2-2-2. color
                  color: Theme.of(context).canvasColor,

                  ///2-2-3. TextField
                  child: const TextField(

                    ///2-2-3-1. autocorrect
                    autocorrect: false,

                    ///2-2-3-2. decoration
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top:5.0,
                        bottom:5.0,
                        left:10.0,
                      ),
                      border: OutlineInputBorder(),
                      hintText: "댓글 작성",
                      suffixIcon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      )
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

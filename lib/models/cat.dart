/**
 * id: 고양이 게시물 고유 ID (추후 파이어베이스에서 자동 생성)
 * name: 고양이 이름
 * title: 고양이 게시물 제목
 * link: 고양이 사진 링크(url일수도 있고, 다른 형식의 링크일 수도 있음)
 * likeCount: 좋아요 수
 * replyCount: 댓글 수
 * created: 게시물 생성 시각
 */
class Cat {
  final String id;
  final String name;
  final String title;
  final String link;
  final int likeCount;
  final int replyCount;
  final DateTime created;

  Cat({ required this.id, required this.name, required this.title, required this.link, required this.likeCount,
    required this.replyCount, required this.created});
}


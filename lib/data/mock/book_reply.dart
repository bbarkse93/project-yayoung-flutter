class BookReply {
  late int id;
  late String content;
  final String? createdAt;
  late int userId;
  late int bookId;

  BookReply({
    required this.id,
    required this.content,
    this.createdAt,
    required this.userId,
    required this.bookId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'createdAt': createdAt,
      'userId': userId,
      'bookId': bookId, // book 자체의 데이터보다 서버에 필요한 데이터만 보내는 것이 제일 효율적
    };
  }

  BookReply.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['content'],
        createdAt = json['createdAt'],
        userId = json['userId'],
        bookId = json['bookId']; // Book 클래스의 fromJson 메서드 사용
}

List<BookReply> bookReplys = [
  BookReply(
      id: 1,
      content: "정말 도움 많이 되었습니다. 감사합니다",
      createdAt: "2023-10-10",
      userId: 1,
      bookId: 1),
  BookReply(
      id: 2, content: "잘봤습니다", createdAt: "2023-10-10", userId: 2, bookId: 1),
  BookReply(
      id: 3, content: "재밌네요", createdAt: "2023-10-10", userId: 3, bookId: 1),
];
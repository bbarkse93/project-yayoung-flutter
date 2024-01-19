class ReviewWriteDTO {
  final String? content;
  final int? cleanliness;
  final int? managementness;
  final int? friendliness;

  ReviewWriteDTO({
    this.content,
    this.cleanliness,
    this.managementness,
    this.friendliness,
  });

  Map<String, dynamic> toJson() => {
        "content": content,
        "cleanliness": cleanliness,
        "managementness": managementness,
        "friendliness": friendliness,
      };
}

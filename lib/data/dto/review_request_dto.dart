class ReviewWriteDTO {
  final String? content;
  final double? cleanliness;
  final double? managementness;
  final double? friendliness;

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

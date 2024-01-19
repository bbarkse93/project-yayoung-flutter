
class CampListDTO {
  final List<String>? optionNames;

  CampListDTO(
      {this.optionNames});

  Map<String, dynamic> toJson() => {
    "optionNames": optionNames,
  };

  Map<String, dynamic> toQueryParameters() {
    return {
      if (optionNames != null) 'optionNames': optionNames!.join(','),
    };
  }
}

class CampSaveOrDeleteDTO {
  late final int campId;
  CampSaveOrDeleteDTO(this.campId);

  Map<String, dynamic> toJson() => {
    "campId": campId,
  };

}
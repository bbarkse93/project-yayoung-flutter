
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
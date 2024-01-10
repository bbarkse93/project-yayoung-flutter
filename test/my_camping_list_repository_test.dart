import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';

void main() async{
  await fetchMyCampingList();
}

Future<void> fetchMyCampingList() async{
  Response response = await dio.get(
    "/camp/myCamp"
  );
  Logger().d(response);

  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

}


import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final Dio dio = Dio(
  BaseOptions(

    // baseUrl: "http://192.168.0.141:8080", // 메인 서버
    // baseUrl: "http://192.168.0.141:8080", // 메인 서버
    // baseUrl: "http://192.168.0.43:8080", // 세환 서버
    // baseUrl: "http://192.168.0.48:8080", // 우진 서버
    baseUrl: "http://192.168.0.41:8080", // 은혜 서버
    // baseUrl: "http://192.168.0.48:8080", // 승신 서버
    // baseUrl: "http://192.168.0.167:8080",  // 대욱 서버
    // baseUrl: "http://192.168.0.134:8080", // 언약 서버


    contentType: "application/json; charset=utf-8",
  ),
);

final FlutterSecureStorage secureStorage = FlutterSecureStorage();
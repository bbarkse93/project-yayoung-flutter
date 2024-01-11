import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.0.7:8080",
    contentType: "application/json; charset=utf-8",
  ),
);

final FlutterSecureStorage secureStorage = FlutterSecureStorage();
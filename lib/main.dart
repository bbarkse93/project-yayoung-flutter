import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/theme.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// TODO: Test위해서 토큰 가지게 셋팅
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String token =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwcm9qZWN0LWtleSIsImlkIjoxLCJ1c2VybmFtZSI6bnVsbCwiZXhwIjo0ODU5MDUzNDgyfQ.Ky2-BLYTjxlouBRsY1HScpc3fC3FOhpK0OrCKy3MFFW6KkCC19B2KsZrd9NIYLoeYY1YEB2BQNLT_KjPETTPMw";
  await secureStorage.write(key: "jwt", value: token);
  KakaoSdk.init(nativeAppKey: "edc929f8703514e3d119422f3935375b");


  runApp(
    ProviderScope(
      child: const MyApp(),

    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Move.mainScreenPage,
      routes: getRouters(),
      theme: theme(),
    );
  }
}

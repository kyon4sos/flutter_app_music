import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/music.dart';

var musicUrl =
    "https://api.uomg.com/api/rand.music?sort=%E7%83%AD%E6%AD%8C%E6%A6%9C&format=json";
var options = BaseOptions(
  baseUrl: 'https://www.xx.com/api',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
Dio dio = Dio(options);

class Api {
  static Future<Music?> getMusic() async {
    try {
      var response = await dio.get(musicUrl);
      var music = Music.fromJson(response.data["data"]);
      print("api : " + music.name!);
      return music;
    } catch (error) {
      return null;
    }
  }
}

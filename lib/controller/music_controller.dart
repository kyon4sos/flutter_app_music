import 'package:get/get.dart';
import 'package:flutter_application_1/api.dart';
import '../model/music.dart';

class MusicController extends GetxController {
  RxList<Music> musics = RxList<Music>();

  void getMusic() async {
    for (var i = 0; i <= 10; i++) {}
    Music? music = await Api.getMusic();
    print(music!.name);
    musics.add(music);
  }
}

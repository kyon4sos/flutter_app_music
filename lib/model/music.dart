import 'package:json_annotation/json_annotation.dart';
part 'music.g.dart';

@JsonSerializable()
class Music {
  String? url;
  String? name;
  String? picurl;
  String? artistsName;

  Music({this.name, this.url, this.artistsName, this.picurl});
  factory Music.fromJson(Map<String, dynamic> json) => _$MusicFromJson(json);
  Map<String, dynamic> toJson() => _$MusicToJson(this);
}

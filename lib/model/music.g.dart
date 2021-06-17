// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Music _$MusicFromJson(Map<String, dynamic> json) {
  return Music(
    name: json['name'] as String?,
    url: json['url'] as String?,
    artistsName: json['artistsName'] as String?,
    picurl: json['picurl'] as String?,
  );
}

Map<String, dynamic> _$MusicToJson(Music instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'picurl': instance.picurl,
      'artistsName': instance.artistsName,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDetailModel _$AlbumDetailModelFromJson(Map<String, dynamic> json) =>
    AlbumDetailModel(
      albumId: json['albumId'] as int?,
      id: json['id'] as int?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$AlbumDetailModelToJson(AlbumDetailModel instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };

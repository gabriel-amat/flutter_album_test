
import 'package:json_annotation/json_annotation.dart';

part 'album_detail_model.g.dart';

@JsonSerializable()
class AlbumDetailModel{
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  AlbumDetailModel({
    this.albumId,
    this.id,
    this.thumbnailUrl,
    this.title,
    this.url,
  });

  factory AlbumDetailModel.fromJson(Map<String, dynamic> json)
    => _$AlbumDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumDetailModelToJson(this);
}
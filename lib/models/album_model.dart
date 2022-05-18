import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable()
class AlbumModel {
  int? userId;
  int? id;
  String? title;

  AlbumModel({
    this.title,
    this.id,
    this.userId,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
}

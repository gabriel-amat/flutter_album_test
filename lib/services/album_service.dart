import 'package:dio/dio.dart';
import 'package:test_app/models/album_detail_model.dart';
import 'package:test_app/models/album_model.dart';

class AlbumService {
  var dio = Dio();

  Future<List<AlbumModel>> getAlbums() async {
    try {
      Response res =
          await dio.get("https://jsonplaceholder.typicode.com/albums/");

      return List<AlbumModel>.from(
        res.data.map((e) => AlbumModel.fromJson(e)).toList(),
      );
    } catch (err) {
      print("getAlbums error $err");
      if (err is DioError) {
        //handle error as 404, 500
      } else {
        //handle error
      }
      return [];
    }
  }

  Future<List<AlbumDetailModel>> getAlbumDetail(int id) async {
    try {
      Response res = await dio.get(
        "https://jsonplaceholder.typicode.com/albums/$id/photos",
      );

      return List<AlbumDetailModel>.from(
        res.data.map((e) => AlbumDetailModel.fromJson(e)).toList(),
      );
    } catch (err) {
      print("getAlbumDetail error $err");
      if (err is DioError) {
        //handle error as 404, 500
      } else {
        //handle error
      }
      return [];
    }
  }
}

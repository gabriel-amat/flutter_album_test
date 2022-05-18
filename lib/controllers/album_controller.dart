import 'package:get/get.dart';
import 'package:test_app/models/album_detail_model.dart';
import 'package:test_app/models/album_model.dart';
import 'package:test_app/services/album_service.dart';

class AlbumController extends GetxController {
  final albumService = AlbumService();

  var albums = <AlbumModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getAlbums();
  }

  Future<void> getAlbums() async {
    isLoading(true);
    albums.addAll(await albumService.getAlbums());
    isLoading(false);
  }

  Future<List<AlbumDetailModel>> getAlbumDetail(int id) async {
    return await albumService.getAlbumDetail(id);
  }
}

import 'package:get/get.dart';
import 'package:test_app/controllers/album_controller.dart';

class ControllersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AlbumController>(AlbumController());
  }

}
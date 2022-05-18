import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/album_controller.dart';
import 'package:test_app/pages/album/album_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future onTap(
    AlbumController controller,
    int index,
    BuildContext context,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        margin: const EdgeInsets.all(8),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 500),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
            SizedBox(width: 8),
            Text("Carregando dados do album..."),
          ],
        ),
      ),
    );

    var res = await controller.getAlbumDetail(
      controller.albums[index].id!,
    );

    if (res.isNotEmpty) {
      Get.to(AlbumDetailPage(albums: res));
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AlbumController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Albums"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Lista de albuns",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 22),
            Obx(
              () {
                return controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Flexible(
                        fit: FlexFit.loose,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.albums.length,
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () => onTap(controller, index, context),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    controller.albums[index].title ?? "Album sem titulo",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

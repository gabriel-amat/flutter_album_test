import 'package:flutter/material.dart';
import 'package:test_app/models/album_detail_model.dart';

class AlbumDetailPage extends StatelessWidget {
  final List<AlbumDetailModel> albums;

  const AlbumDetailPage({
    Key? key,
    required this.albums,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Albums"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: albums.isEmpty
            ? const Center(
                child: Text("Nenhum item encontrado"),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: albums.length,
                itemBuilder: (context, i) {
                  var data = albums[i];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: data.thumbnailUrl != null
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                  albums[i].thumbnailUrl!,
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50,
                                ),
                            )
                            : const Icon(Icons.image),
                        title: Text(data.title ?? "Sem titulo"),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

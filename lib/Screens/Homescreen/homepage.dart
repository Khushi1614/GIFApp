import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../Controllers/GifController.dart';
import '../Favorite.dart';

final GifController gifController = Get.put(GifController());

class GiphyHome extends StatefulWidget {
  const GiphyHome({super.key});

  @override
  State<GiphyHome> createState() => _GiphyHomeState();
}
TextEditingController _controller = TextEditingController();

class _GiphyHomeState extends State<GiphyHome> {
  @override
  Widget build(BuildContext context) {
    gifController.fetchTrendingGifs();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,

          decoration: InputDecoration(
            hintText: 'Search GIFs...',
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _controller.clear();
                gifController.setSearchQuery('');
                gifController.fetchTrendingGifs();
              },
            ),
          ),
          onChanged: (text) {
            gifController.setSearchQuery(text);
            if (text.isEmpty) {
              gifController.fetchTrendingGifs();
            } else {
              gifController.searchGifs(text);
            }
          },
        ),
      ),

      body: Obx(() {
        if (gifController.loading.value && gifController.gifs.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (!gifController.loading.value &&
                  gifController.hasMore.value &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                if (gifController.searching.value) {
                  gifController.searchGifs(gifController.searchQuery.value);
                } else {
                  gifController.fetchTrendingGifs();
                }
              }
              return false;
            },
            child: GifGrid(),
          );
        }
      }),
    );
  }

}


class GifGrid extends StatelessWidget {

  const GifGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing:  8.0,
        ),
        itemCount: gifController.gifs.length + (gifController.hasMore.value ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == gifController.gifs.length) {
            // Loading indicator at the end
            return const Center(child: CircularProgressIndicator());
          }
          final gif = gifController.gifs[index];
          final gifId = gif['id'];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                gifController.toggleFavorite(gifId);
              },
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: gif['images']['fixed_height']['url'],
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Obx(() => IconButton(
                      icon: Icon(
                        gifController.isFavorite(gifId) ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        gifController.toggleFavorite(gifId);
                      },
                    )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => FavoriteGifsScreen());
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}

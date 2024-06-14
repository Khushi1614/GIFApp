import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'Homescreen/homepage.dart';
class FavoriteGifsScreen extends StatelessWidget {
  const FavoriteGifsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite GIFs'),
      ),
      body: Obx(() {
        final favoriteGifs = gifController.gifs
            .where((gif) => gifController.isFavorite(gif['id']))
            .toList();

        if (favoriteGifs.isEmpty) {
          return const Center(
            child: Text('No favorite GIFs yet!'),
          );
        } else {
          return ListView.builder(
            itemCount: favoriteGifs.length,
            itemBuilder: (context, index) {
              final gif = favoriteGifs[index];
              return ListTile(
                leading: CachedNetworkImage(
                  imageUrl: gif['images']['fixed_height']['url'],
                  width: 50,
                  height: 50,
                  placeholder: (context, url) =>
                  const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
                title: Text(gif['title'] ?? 'Untitled'),
                // Add more details or actions if needed
              );
            },
          );
        }
      }),
    );
  }
}



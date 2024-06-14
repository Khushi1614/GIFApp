
import 'package:get/get.dart';

import '../Model/GifService.dart';

class GifController extends GetxController {
  final GiphyApiService _giphyApiService = GiphyApiService();

  var gifs = [].obs;
  var loading = false.obs;
  var searching = false.obs;
  var searchQuery = ''.obs;
  var offset = 0.obs;
  var hasMore = true.obs;

  final RxSet<String> favorites = <String>{}.obs;

  void fetchTrendingGifs() async {
    if (loading.value) return;

    loading.value = true;

    try {
      final data = await _giphyApiService.fetchTrendingGifs(offset.value);
      gifs.addAll(data['data']);
      offset.value += 25;
      hasMore.value = data['pagination']['total_count'] > offset.value;
    } catch (e) {
      print(e);
    } finally {
      loading.value = false;
    }
  }

  void searchGifs(String query) async {
    if (loading.value || searchQuery.value != query) return;

    loading.value = true;

    try {
      final data = await _giphyApiService.searchGifs(query, offset.value);
      if (searchQuery.value != query) {
        gifs.value = data['data'];
      } else {
        gifs.addAll(data['data']);
      }
      offset.value += 25;
      hasMore.value = data['pagination']['total_count'] > offset.value;
    } catch (e) {
      print(e);
    } finally {
      loading.value = false;
    }
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
    offset.value = 0;
    gifs.clear();
    hasMore.value = true;
  }

  void toggleFavorite(String gifId) {
    if (favorites.contains(gifId)) {
      favorites.remove(gifId);
    } else {
      favorites.add(gifId);
    }
  }

  bool isFavorite(String gifId) {
    return favorites.contains(gifId);
  }
}

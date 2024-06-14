import 'dart:convert';
import 'package:http/http.dart' as http;

class GiphyApiService {
  final String apiKey = 'qFR6up3jAI7nPH0vxrM9Cg7wv8MJdDOt';

  Future<Map<String, dynamic>> fetchTrendingGifs(int offset) async {
    final response = await http.get(Uri.parse(
        'https://api.giphy.com/v1/gifs/trending?api_key=$apiKey&limit=25&offset=$offset'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load trending GIFs');
    }
  }

  Future<Map<String, dynamic>> searchGifs(String query, int offset) async {
    final response = await http.get(Uri.parse(
        'https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$query&limit=25&offset=$offset'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to search GIFs');
    }
  }
}

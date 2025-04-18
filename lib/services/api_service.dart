import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/image_item.dart';

class ApiService {
  final String apiKey = '49737932-fee9ce98f8a9fa2745332302f';

  Future<List<ImageItem>> fetchImages(String query, int page) async {
    final url = Uri.parse('https://pixabay.com/api/?key=$apiKey&q=$query&image_type=photo&page=$page&per_page=20');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return (jsonData['hits'] as List)
          .map((hit) => ImageItem.fromJson(hit))
          .toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}

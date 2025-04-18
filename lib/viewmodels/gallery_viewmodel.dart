import 'package:flutter/material.dart';
import '../models/image_item.dart';
import '../services/api_service.dart';

class GalleryViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<ImageItem> _images = [];
  int _page = 1;
  bool _isLoading = false;
  String _query = 'nature';

  List<ImageItem> get images => _images;
  bool get isLoading => _isLoading;

  Future<void> fetchImages({bool loadMore = false}) async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    if (loadMore) _page++;
    final results = await _apiService.fetchImages(_query, _page);
    if (loadMore) {
      _images.addAll(results);
    } else {
      _images = results;
    }

    _isLoading = false;
    notifyListeners();
  }

  void search(String query) {
    _query = query;
    _page = 1;
    fetchImages();
  }
}
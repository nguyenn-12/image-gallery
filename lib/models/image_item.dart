class ImageItem {
  final String previewURL;
  final String largeImageURL;
  final String tags;

  ImageItem({required this.previewURL, required this.largeImageURL, required this.tags});

  factory ImageItem.fromJson(Map<String, dynamic> json) {
    return ImageItem(
      previewURL: json['previewURL'],
      largeImageURL: json['largeImageURL'],
      tags: json['tags'],
    );
  }
}
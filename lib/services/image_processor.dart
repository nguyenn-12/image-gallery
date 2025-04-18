import 'package:tflite_flutter/tflite_flutter.dart';

class ImageProcessor {
  late Interpreter interpreter;

  Future<void> loadModel() async {
    interpreter = await Interpreter.fromAsset('object_detection.tflite');
  }

  List<dynamic> processImage(dynamic imageData) {
    // TODO: Chuyển đổi dữ liệu đầu vào phù hợp và xử lý inference
    return [];
  }
}

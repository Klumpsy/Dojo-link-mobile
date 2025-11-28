class WazaModel {
  final String name;
  final String description;
  final String? imagePath;
  final String? videoPath;

  WazaModel({
    required this.name,
    required this.description,
    this.imagePath,
    this.videoPath,
  });

  factory WazaModel.fromMap(Map<String, dynamic> map) {
    return WazaModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imagePath: map['image_path'], // can be null
      videoPath: map['video_path'], // can be null
    );
  }
}

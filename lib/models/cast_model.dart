import 'dart:convert';

/// Representa as  informações sobre o elenco do filme
class CastModel {
  final String name;
  final String image;
  final String character; // Personagem representado pelo ator

  CastModel({
    required this.name,
    required this.image,
    required this.character,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'character': character,
    };
  }

  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      name: map['original_name'],
      image: 'https://image.tmdb.org/t/p/w200${map['profile_path']}',
      character: map['character'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CastModel.fromJson(String source) =>
      CastModel.fromMap(json.decode(source));
}

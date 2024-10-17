import 'package:pokemon_app_flutter/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel(
      {required super.name, required super.image, required super.id});

  factory PokemonModel.fromEntity(PokemonEntity pokemon) =>
      PokemonModel(name: pokemon.image, image: pokemon.image, id: pokemon.id);

  factory PokemonModel.fromMap(Map<String, dynamic> json) => PokemonModel(
        id: json[_idCodingKey],
        name: json[_nameCodingKey],
        image: json[_baseImageCodingKey][_imageCodingKey],
      );

  Map<String, dynamic> toMap() => {
        _idCodingKey: id,
        _nameCodingKey: name,
        _baseImageCodingKey: {_imageCodingKey: image}
      };

  // coding keys
  static const String _idCodingKey = 'id';
  static const String _nameCodingKey = 'name';
  static const String _baseImageCodingKey = 'sprites';
  static const String _imageCodingKey = 'front_default';
}

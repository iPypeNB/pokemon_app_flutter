import 'package:pokemon_app_flutter/features/pokemon/data/models/pokemon_model.dart';

abstract class PokemonLocalDataSource {
  Future<bool> capturePokemon(PokemonModel pokemon);
  Future<List<PokemonModel>> getCapturedPokemonList();
}
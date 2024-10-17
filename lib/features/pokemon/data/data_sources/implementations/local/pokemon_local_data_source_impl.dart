import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_app_flutter/core/errors/failures.dart';
import 'package:pokemon_app_flutter/features/pokemon/data/data_sources/interfaces/local/pokemon_local_data_source.dart';
import 'package:pokemon_app_flutter/features/pokemon/data/models/pokemon_model.dart';

class HivePokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  HivePokemonLocalDataSourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<bool> capturePokemon(PokemonModel pokemon) async {
    try {
      Box<dynamic> box = await Hive.openBox(_pokemonBoxCodingKey);
      box.put(pokemon.id, pokemon.toMap());

      return true;
    } catch (error) {
      throw LocalDatabaseFailure();
    }
  }

  @override
  Future<List<PokemonModel>> getCapturedPokemonList() async {
    try {
      Box<dynamic> box = await Hive.openBox(_pokemonBoxCodingKey);
      return box.values.map((pokemon) => PokemonModel.fromMap(pokemon))
          .toList();
    } catch (error) {
      throw LocalDatabaseFailure();
    }
  }

  // coding keys
  static const _pokemonBoxCodingKey = 'pokemons';

}
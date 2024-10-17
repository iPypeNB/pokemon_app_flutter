import 'package:dio/dio.dart';

import 'package:pokemon_app_flutter/features/pokemon/data/data_sources/interfaces/remote/pokemon_remote_data_source.dart';
import 'package:pokemon_app_flutter/features/pokemon/data/models/pokemon_model.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<PokemonModel> getPokemon(int id) async {
    final resp = await dio.get('https://pokeapi.co/api/v2/pokemon/$id/');

    return PokemonModel.fromMap(resp.data);
  }
}

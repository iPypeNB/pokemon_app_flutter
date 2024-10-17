import 'package:dartz/dartz.dart';
import 'package:pokemon_app_flutter/core/errors/failures.dart';
import 'package:pokemon_app_flutter/features/pokemon/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonEntity>> getPokemon(int id);

  Future<Either<Failure, bool>> capturePokemon(PokemonEntity pokemon);

  Future<Either<Failure, List<PokemonEntity>>> getCapturedPokemon(int id);
}

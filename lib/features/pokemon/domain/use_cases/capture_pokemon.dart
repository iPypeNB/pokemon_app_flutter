import 'package:dartz/dartz.dart';
import 'package:pokemon_app_flutter/core/errors/failures.dart';
import 'package:pokemon_app_flutter/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app_flutter/features/pokemon/domain/repositories/pokemon_repository.dart';

class CapturePokemonUseCase {
  CapturePokemonUseCase({required this.pokemonRepository});

  final PokemonRepository pokemonRepository;

  Future<Either<Failure, bool>> call(PokemonEntity pokemon) {
    return pokemonRepository.capturePokemon(pokemon);
  }
}
import 'package:dartz/dartz.dart';
import 'package:pokemon_app_flutter/core/errors/failures.dart';
import 'package:pokemon_app_flutter/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app_flutter/features/pokemon/domain/repositories/pokemon_repository.dart';

class FindPokemonUseCase {
  FindPokemonUseCase({required this.pokemonRepository});

  final PokemonRepository pokemonRepository;

  Future<Either<Failure, PokemonEntity>> call(int id) {
    return pokemonRepository.getPokemon(id);
  }
}
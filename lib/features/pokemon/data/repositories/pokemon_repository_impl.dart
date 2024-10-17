import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokemon_app_flutter/core/errors/failures.dart';
import 'package:pokemon_app_flutter/features/pokemon/data/data_sources/interfaces/local/pokemon_local_data_source.dart';
import 'package:pokemon_app_flutter/features/pokemon/data/data_sources/interfaces/remote/pokemon_remote_data_source.dart';
import 'package:pokemon_app_flutter/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokemon_app_flutter/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app_flutter/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonLocalDataSource pokemonLocalDataSource;
  final PokemonRemoteDataSource pokemonRemoteDataSource;

  PokemonRepositoryImpl({
    required this.pokemonLocalDataSource,
    required this.pokemonRemoteDataSource,
  });

  @override
  Future<Either<Failure, bool>> capturePokemon(PokemonEntity pokemon) async {
    try {
      final request = PokemonModel.fromEntity(pokemon);
      final bool resp = await pokemonLocalDataSource.capturePokemon(request);

      return Right(resp);
    } on LocalDatabaseFailure {
      return Left(LocalDatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<PokemonEntity>>> getCapturedPokemon(int id) async {
    try {
      final List<PokemonEntity> resp = await pokemonLocalDataSource.getCapturedPokemonList();

      return Right(resp);
    } on LocalDatabaseFailure {
      return Left(LocalDatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonEntity>> getPokemon(int id) async {
    try {
      final PokemonEntity resp = await pokemonRemoteDataSource.getPokemon(id);

      return Right(resp);
    } on DioException {
      return Left(ServerFailure());
    }
  }
}

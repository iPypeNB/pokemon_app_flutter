import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app_flutter/core/errors/failures.dart';
import 'package:pokemon_app_flutter/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app_flutter/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:pokemon_app_flutter/features/pokemon/domain/use_cases/find_pokemon.dart';
import 'package:pokemon_app_flutter/features/pokemon/domain/use_cases/get_captured_pokemon.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc({
    required this.capturePokemonUseCase,
    required this.getCapturedPokemonUseCase,
    required this.findPokemonUseCase,
  }) : super(InitialState()) {
    on<FindPokemonEvent>(_onFindPokemon);
    on<CapturePokemonEvent>(_onCapturePokemon);
  }

  final CapturePokemonUseCase capturePokemonUseCase;
  final GetCapturedPokemonUseCase getCapturedPokemonUseCase;
  final FindPokemonUseCase findPokemonUseCase;

  FutureOr<void> _onFindPokemon(
      FindPokemonEvent event, Emitter<PokemonState> emit) async {
    emit(LoadingState());

    final resp = await findPokemonUseCase(event.id);

    resp.fold(
      (failure) => emit(PokemonFailure(failure: failure)),
      (pokemon) => emit(PokemonSuccess(pokemon: pokemon)),
    );
  }

  FutureOr<void> _onCapturePokemon(
      CapturePokemonEvent event, Emitter<PokemonState> emit) async {
    final resp = await capturePokemonUseCase(event.pokemon);

    resp.fold(
      (failure) => emit(PokemonFailure(failure: failure)),
      (b) =>
          emit(PokemonSuccess(pokemon: event.pokemon, showNotification: true)),
    );
  }


}

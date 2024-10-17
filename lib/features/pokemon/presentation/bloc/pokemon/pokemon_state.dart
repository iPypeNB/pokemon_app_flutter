part of 'pokemon_bloc.dart';

sealed class PokemonState {
  const PokemonState();
}

final class InitialState extends PokemonState {}

final class LoadingState extends PokemonState {}

final class PokemonSuccess extends PokemonState {
  const PokemonSuccess({
    required this.pokemon,
    this.showNotification = false,
  });

  final PokemonEntity pokemon;
  final bool showNotification;
}

final class PokemonFailure extends PokemonState {
  const PokemonFailure({required this.failure});

  final Failure failure;
}

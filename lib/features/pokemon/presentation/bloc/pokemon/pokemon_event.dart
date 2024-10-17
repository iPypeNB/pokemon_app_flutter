part of 'pokemon_bloc.dart';

sealed class PokemonEvent {
  const PokemonEvent();
}

final class FindPokemonEvent extends PokemonEvent {

  const FindPokemonEvent({required this.id});

  final int id;

}

final class CapturePokemonEvent extends PokemonEvent {

  const CapturePokemonEvent({required this.pokemon});

  final PokemonEntity pokemon;
}
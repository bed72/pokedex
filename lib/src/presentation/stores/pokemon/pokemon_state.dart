part of 'pokemon_dispatch.dart';

@immutable
abstract class PokemonState extends Equatable {}

@immutable
class PokemonInitial extends PokemonState {
  @override
  List<Object?> get props => [];
}

@immutable
class PokemonLoading extends PokemonState {
  @override
  List<Object?> get props => [];
}

@immutable
class PokemonSeccess extends PokemonState {
  late final List<PokemonEntity> value;

  PokemonSeccess({
    required this.value,
  });

  @override
  List<Object?> get props => [
        value,
      ];
}

@immutable
class PokemonFailure extends PokemonState {
  late final String message;

  PokemonFailure({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

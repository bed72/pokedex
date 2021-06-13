import '../../domain/entities/pokemon/pokemon_entity.dart';

class RemotePokemonsModel {
  late final List<PokemonEntity> pokemons;

  RemotePokemonsModel({
    required this.pokemons,
  });

  factory RemotePokemonsModel.fromJson(Map<String, dynamic> json) {
    final List<PokemonEntity> _pokemons = PokemonsEntity.fromJson(json).pokemon;

    return RemotePokemonsModel(pokemons: _pokemons);
  }

  PokemonsEntity toEntity() => PokemonsEntity(
        pokemon: pokemons,
      );
}

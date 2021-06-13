import '../../domain/entities/pokemon/pokemon_entity.dart';

class RemotePokemonsModel {
  late final List<PokemonEntity> pokemons;

  RemotePokemonsModel({
    required this.pokemons,
  });

  factory RemotePokemonsModel.fromJson(Map<String, dynamic> json) {
    // print('\n\n RemotePokemonModel: ${json.runtimeType} \n$json \n\n');
    List<PokemonEntity> _pokemonsList = PokemonsEntity.fromJson(json).pokemon;

    return RemotePokemonsModel(pokemons: _pokemonsList);
  }

  PokemonsEntity toEntity() => PokemonsEntity(
        pokemon: pokemons,
      );
}

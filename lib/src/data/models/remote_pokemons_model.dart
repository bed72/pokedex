import '../../domain/entities/pokemon/pokemon_entity.dart';

class RemotePokemonsModel {
  late final PokemonsEntity pokemons;

  RemotePokemonsModel({
    required this.pokemons,
  }) {
    print('\n\n RemotePokemonModel: ${pokemons.runtimeType} \n$pokemons \n\n');
  }

  factory RemotePokemonsModel.fromJson(Map<String, dynamic> json) {
    print('\n\n RemotePokemonModel: ${json.runtimeType} \n$json \n\n');
    return RemotePokemonsModel(
      pokemons:
          json['pokemon'].map((pokemon) => PokemonsEntity.fromJson(pokemon)),
    );
  }

  PokemonsEntity toEntity() => PokemonsEntity(
        pokemon: pokemons.pokemon,
      );
}

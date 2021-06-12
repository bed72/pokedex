import '../../domain/entities/pokemon/pokemon_entity.dart';

class RemotePokemonsModel {
  late final PokemonsEntity pokemons;

  RemotePokemonsModel({
    required this.pokemons,
  }) {
    print('\n\n RemotePokemonModel: ${pokemons.runtimeType} \n$pokemons \n\n');
  }

  factory RemotePokemonsModel.fromJson(Map<String, dynamic> json) {
    return RemotePokemonsModel(
      pokemons: json['pokemon'].map<Map<String, dynamic>>(
          (pokemon) => PokemonsEntity.fromJson(json)),
    );
  }

  PokemonsEntity toEntity() => PokemonsEntity(
        pokemon: pokemons.pokemon,
      );
}

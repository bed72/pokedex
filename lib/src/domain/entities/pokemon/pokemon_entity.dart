import 'package:equatable/equatable.dart';

class PokemonsEntity extends Equatable {
  late final List<PokemonEntity> pokemon;

  PokemonsEntity({
    required this.pokemon,
  });

  @override
  List<Object?> get props => [
        pokemon,
      ];

  factory PokemonsEntity.fromJson(Map<String, dynamic> json) {
    // print('\n ENTITY: ${json.runtimeType} \n$json \n');
    List<PokemonEntity> _pokemonsList = <PokemonEntity>[];

    json['pokemon'].forEach((pokemon) {
      _pokemonsList.add(PokemonEntity.fromJson(pokemon));
    });

    return PokemonsEntity(pokemon: _pokemonsList);
  }
}

class PokemonEntity extends Equatable {
  late final String name;
  late final String image;
  late final String number;

  late final List<String> type;

  PokemonEntity({
    required this.name,
    required this.image,
    required this.number,
    required this.type,
  });

  @override
  List<Object?> get props => [
        name,
        image,
        number,
        type,
      ];

  factory PokemonEntity.fromJson(Map<String, dynamic> json) {
    // print("\n\n JSON ${json['type'].runtimeType} \n\n");

    return PokemonEntity(
      name: json['name'],
      image: json['img'],
      number: json['num'],
      type: json['type'].map<String>((value) => value.toString()).toList(),
    );
  }
}

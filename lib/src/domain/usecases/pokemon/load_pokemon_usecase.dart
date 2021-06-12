import '../../../domain/entities/pokemon/pokemon_entity.dart';

abstract class LoadPokemon {
  Future<PokemonsEntity> load();
}

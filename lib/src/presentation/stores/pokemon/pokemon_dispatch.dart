import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../../data/usecases/cache/cache_usecase.dart';

import '../../../domain/helpers/domain/domain_error.dart';
import '../../../domain/entities/pokemon/pokemon_entity.dart';
import '../../../domain/usecases/pokemon/load_pokemon_usecase.dart';

part 'pokemon_state.dart';

class PokemonDispatch extends Cubit<PokemonState> {
  late final Cache cache;
  late final LoadPokemon loadPokemon;

  late final PokemonsEntity response;

  PokemonDispatch({
    required this.cache,
    required this.loadPokemon,
  }) : super(PokemonInitial()) {
    callPokemons();
  }

  Future<void> callPokemons() async {
    try {
      emit(PokemonLoading());

      response = await loadPokemon.load();

      if (response.toString().isNotEmpty) {
        emit(PokemonSeccess(values: response.pokemon));
      } else {
        emit(PokemonFailure(message: 'Erro ao pegar os Pokemons!'));
      }
    } on DomainError catch (error) {
      emit(PokemonFailure(message: error.descripition));
    }
  }

  Future<void> savePokemon(int index) async {
    await cache.save(key: 'pokemon', value: response.pokemon[index].toString());
  }

  Future<void> loadPokemons() async {
    final pokemons = await cache.fetch(key: 'pokemon');
    print('\n\n POKEMONS: $pokemons \n\n');
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/helpers/domain/domain_error.dart';
import '../../../domain/entities/pokemon/pokemon_entity.dart';
import '../../../domain/usecases/pokemon/load_pokemon_usecase.dart';

part 'pokemon_state.dart';

class PokemonDispatch extends Cubit<PokemonState> {
  late final LoadPokemon loadPokemon;

  PokemonDispatch({
    required this.loadPokemon,
  }) : super(PokemonInitial()) {
    loadPokemons();
  }

  Future<void> loadPokemons() async {
    try {
      emit(PokemonLoading());

      final PokemonsEntity response = await loadPokemon.load();

      if (response.toString().isNotEmpty) {
        emit(PokemonSeccess(values: response.pokemon));
      } else {
        emit(PokemonFailure(message: 'Erro ao pegar os Pokemons!'));
      }
    } on DomainError catch (error) {
      emit(PokemonFailure(message: error.descripition));
    }
  }
}

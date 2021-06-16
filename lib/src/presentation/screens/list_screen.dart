import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/stores/pokemon/pokemon_dispatch.dart';

class ListScreen extends StatelessWidget {
  late final PokemonDispatch dispatch;

  ListScreen({
    Key? key,
    required this.dispatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: BlocBuilder<PokemonDispatch, PokemonState>(
        bloc: dispatch,
        builder: (BuildContext context, state) {
          if (state is PokemonFailure) {
            return Center(
              child: Text('Ops, algum erro aconteceu!\n${state.message}'),
            );
          } else if (state is PokemonSeccess) {
            return ListView.builder(
              itemCount: state.values.length,
              itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: () => dispatch.savePokemon(index),
                child: Card(
                  child: ListTile(
                    title: Text(state.values[index].name),
                    subtitle: Text('${state.values[index].type.toString()}'),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(state.values[index].image),
                    ),
                  ),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/di/dependency_injection_widget.dart';
import '../../presentation/stores/pokemon/pokemon_dispatch.dart';

class PokemonsScreen extends StatelessWidget {
  late final _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  PokemonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DependencyInjectionWidget(
          url: _url,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            child: BlocBuilder<PokemonDispatch, PokemonState>(
              builder: (BuildContext context, state) {
                if (state is PokemonFailure) {
                  return Center(
                    child: Text('Ops, algum erro aconteceu!\n${state.message}'),
                  );
                } else if (state is PokemonSeccess) {
                  return ListView.builder(
                    itemCount: state.values.length,
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: ListTile(
                        title: Text(state.values[index].name),
                        subtitle:
                            Text('${state.values[index].type.toString()}'),
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(state.values[index].image),
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
          ),
        ),
      ),
    );
  }
}

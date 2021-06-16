import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/stores/pokemon/pokemon_dispatch.dart';

import 'list_screen.dart';
import 'salved_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dispatch = BlocProvider.of<PokemonDispatch>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.account_balance_wallet_rounded)),
              Tab(icon: Icon(Icons.save_rounded)),
            ],
          ),
          centerTitle: true,
          title: Text('Pokedex'),
          brightness: Brightness.dark,
        ),
        body: SafeArea(
          child: TabBarView(
            children: <Widget>[
              ListScreen(dispatch: _dispatch),
              SalvedScreen(dispatch: _dispatch),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/stores/pokemon/pokemon_dispatch.dart';

class SalvedScreen extends StatefulWidget {
  late final PokemonDispatch dispatch;

  SalvedScreen({
    Key? key,
    required this.dispatch,
  }) : super(key: key);

  @override
  _SalvedScreenState createState() => _SalvedScreenState();
}

class _SalvedScreenState extends State<SalvedScreen> {
  @override
  void initState() {
    super.initState();
    widget.dispatch.loadPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDispatch, PokemonState>(
      bloc: widget.dispatch,
      builder: (BuildContext context, state) {
        return Text('');
      },
    );
  }
}

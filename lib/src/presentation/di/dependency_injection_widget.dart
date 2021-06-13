import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infra/http/http_adapter.dart';
import '../../presentation/stores/pokemon/pokemon_dispatch.dart';
import '../../data/usecases/pokemon/remote_load_pokemon_usecase.dart';

class DependencyInjectionWidget extends StatelessWidget {
  late final String url;
  late final Widget child;

  DependencyInjectionWidget({
    Key? key,
    required this.url,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonDispatch>(
          lazy: false,
          create: (BuildContext context) => PokemonDispatch(
            loadPokemon: RemoteLoadPokemon(
              url: url,
              httpClient: HttpAdapter(
                client: Client(),
              ),
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}

import '../../http/http_client.dart';

import '../../models/remote_pokemons_model.dart';

import '../../../domain/helpers/http/http_error.dart';
import '../../../domain/helpers/domain/domain_error.dart';

import '../../../domain/entities/pokemon/pokemon_entity.dart';

import '../../../domain/usecases/pokemon/load_pokemon_usecase.dart';

class RemoteLoadPokemon implements LoadPokemon {
  late final String url;
  late final HttpClient httpClient;

  RemoteLoadPokemon({
    required this.url,
    required this.httpClient,
  });

  @override
  Future<PokemonsEntity> load() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');

      return RemotePokemonsModel.fromJson(httpResponse.body).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}

import 'dart:convert';

import 'package:bigio/models/pokemons_model.dart';
import 'package:http/http.dart' as http;

class PokemonAPI {
  static var instance = PokemonAPI();

  Future<dynamic> getPokemons() async {
    http.Response response = await http.get(Uri.parse(
      Uri.encodeFull("https://pokeapi.co/api/v2/pokemon?limit=151"),
    ));

    try {
      Map<String, dynamic> data = json.decode(response.body);
      PokemonsModel pokemonsModel = PokemonsModel.fromJson(data);
      if (pokemonsModel.results != null) {
        return pokemonsModel;
      } else {
        return null;
      }
    } catch (e) {
      print("error catch get pokemons $e");
    }
  }

  Future<dynamic> getDetailPokemon(String uri) async {
    http.Response response = await http.get(Uri.parse(Uri.encodeFull(uri)));
  }
}

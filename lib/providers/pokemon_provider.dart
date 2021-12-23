import 'package:bigio/apis/pokemon_api.dart';
import 'package:bigio/models/pokemons_model.dart';
import 'package:flutter/material.dart';

class PokemonProvider with ChangeNotifier {
  List<Pokemon>? _pokemons;

  List<Pokemon>? get pokemons => _pokemons;

  void getAllPokemons() {
    PokemonAPI.instance.getPokemons().then((pm) {
      if(pm is PokemonsModel) {
        _pokemons = pm.results;
        notifyListeners();
      }
    });
  }
}
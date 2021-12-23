import 'package:bigio/providers/pokemon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    var pp = Provider.of<PokemonProvider>(context, listen: false);
    pp.getAllPokemons();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonProvider>(builder: (context, pp, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Pokedex"),
        ),
        body: (pp.pokemons != null)
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.brown[200],
                child: ListView.builder(
                    itemCount: pp.pokemons?.length ?? 0,
                    itemBuilder: (context, index) {
                      var pokemon = pp.pokemons![index];
                      return Container(
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    pokemon.name!.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                    "https://img.pokemondb.net/artwork/large/${pokemon.name!}.jpg"),
                              )
                            ],
                          ));
                    }),
              )
            : const Center(child: CircularProgressIndicator()),
      );
    });
  }
}

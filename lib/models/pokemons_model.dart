class PokemonsModel {
  int? _count;
  String? _next;
  String? _previous;
  List<Pokemon>? _results;

  PokemonsModel(
      {int? count, String? next, String? previous, List<Pokemon>? results}) {
    this._count = count;
    this._next = next;
    this._previous = previous;
    this._results = results;
  }

  int? get count => _count;
  String? get next => _next;
  String? get previous => _previous;
  List<Pokemon>? get results => _results;

  PokemonsModel.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    _next = json['next'];
    _previous = json['previous'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results!.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    data['next'] = this._next;
    data['previous'] = this._previous;
    if (this._results != null) {
      data['results'] = this._results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  String? _name;
  String? _url;

  Pokemon({String? name, String? url}) {
    this._name = name;
    this._url = url;
  }

  String? get name => _name;
  String? get url => _url;

  Pokemon.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['url'] = this._url;
    return data;
  }
}

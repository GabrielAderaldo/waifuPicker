/// RESPONSABILIDADE DESSA CLASSE:
/// - Entidade que representa um objeto Waifu
/// - Possui um método copyWith para fazer cópias de objetos
/// - Possui um método factory que converte um JSON em um objeto Waifu
/// - Possui um atributo url que é uma String
/// - Possui um construtor que inicializa o atributo url

class Waifu{
  String? url;

  Waifu({this.url});

  copyWith({String? url}){
    return Waifu(
      url: url ?? this.url
    );
  }

  factory Waifu.fromJson(Map<String, dynamic> json){
    return Waifu(
      url: json['url']
    );
  }

}
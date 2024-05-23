class Tema{
  int id;
  String nombre;
  String pageMovil;

  Tema({
    required this.id,
    required this.nombre,
    required this.pageMovil
  });

  factory Tema.fromJson(final json){
    return Tema(
        id: json["topicId"],
        nombre: json["topic"],
        pageMovil: json["pageMovil"]
    );
  }
}

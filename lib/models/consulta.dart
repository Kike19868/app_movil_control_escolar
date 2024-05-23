class Consulta{
  int estatusId;
  String numero;
  String correo;
  String topic;
  String estatus;
  String creado;
  String link;
  String error;

  Consulta({
    required this.estatusId,
    required this.numero,
    required this.correo,
    required this.topic,
    required this.estatus,
    required this.creado,
    required this.link,
    required this.error
  });

  factory Consulta.fromJson(final json){
    return Consulta(
        estatusId: json["estatusId"],
        numero: json["numero"],
        correo: json["correo"],
        topic: json["topic"],
        estatus: json["estatus"],
        creado: json["creado"],
        link: json["link"],
        error: json["error"]
    );
  }
}

class Respuesta{
  int estatusId;
  String numeroTicket;
  String error;

  Respuesta({
    required this.estatusId,
    required this.numeroTicket,
    required this.error
  });

  factory Respuesta.fromJson(final json){
    return Respuesta(
        estatusId: json["estatusId"],
        numeroTicket: json["numeroTicket"],
        error: json["error"]
    );
  }
}

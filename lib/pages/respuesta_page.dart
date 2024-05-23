import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mesadeservicio/models/respuesta.dart';
import 'package:mesadeservicio/models/api_data.dart';
import 'package:mesadeservicio/routes/route_name.dart';

class RespuestaPage extends StatefulWidget {
  final ApiData ticket;
  const RespuestaPage({super.key, required this.ticket});

  @override
  State<RespuestaPage> createState() => _RespuestaPageState();
}

class _RespuestaPageState extends State<RespuestaPage> {
  late Future<Respuesta> respuesta;
  final headers = {"Content-Type":"application/json;charset=UTF-8"};

  _RespuestaPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Estatus del ticket",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18, )),
          backgroundColor: Colors.grey,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder<Respuesta>(
            future: respuesta,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if(snapshot.data!.estatusId == 1){
                  return Center(
                        child: Column(
                            children: <Widget>[
                              const Padding(padding: EdgeInsets.all(20.0)),
                              Image.asset("assets/images/logo.png"),
                              const Text("Gracias por contactarnos", style: TextStyle(fontWeight: FontWeight.bold)),
                              const Padding(padding: EdgeInsets.all(20.0)),
                              const Text("Tu ticket ha sido creado de forma exitosa con el número:"),
                              const SizedBox(height: 10),
                              Text(snapshot.data!.numeroTicket, style: const TextStyle(fontWeight: FontWeight.bold)),
                              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0)),
                              const Text("Le daremos el seguimiento correspondiente a la brevedad posible."),
                              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0)),
                              MaterialButton(
                                color: Colors.teal,
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context,RouteName.homePage);
                                },
                                child: const Text('Aceptar',style: TextStyle(color: Colors.black)),
                              )
                            ],
                          ),
                  );
                }else{
                  return Center(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Container(
                          height: 150,width: 200,color: Colors.red[200],alignment: Alignment.center,
                          child: Text("Error al crear el ticket: ${snapshot.data!.error}"),
                        ),
                        const SizedBox(height: 10),
                        MaterialButton(
                          color: const Color(0xFFEB5F62),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context,RouteName.homePage);
                          },
                          child: const Text('Aceptar'),
                        )
                      ],
                    ),
                  );
                }
              }
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Container(
                        height: 150,width: 200,color: Colors.red[200],alignment: Alignment.center,
                        child: Text("Error al crear el ticket: ${snapshot.error}"),
                      ),
                      const SizedBox(height: 10),
                      MaterialButton(
                        color: const Color(0xFFEB5F62),
                        onPressed: () {
                          Navigator.pushNamed(context,RouteName.homePage);
                        },
                        child: const Text('Aceptar'),
                      )
                    ],
                  ),
                );
              }
              return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                  )
              );
            })
    );
  }

  @override
  void initState() {
    super.initState();
    respuesta = crearAspGralTicket();
  }

  Future<Respuesta> crearAspGralTicket() async {
    print("Invocando la creación del ticket ${widget.ticket.campos}");
    final serviceUri = Uri.parse(widget.ticket.urlServicio);
    final res = await http.post(serviceUri,headers: headers, body: jsonEncode(widget.ticket.campos));
    final element = json.decode(res.body);
    return Respuesta.fromJson(element);
  }
}
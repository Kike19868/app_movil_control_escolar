import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mesadeservicio/models/consulta.dart';
import 'package:mesadeservicio/models/api_data.dart';
import 'package:mesadeservicio/routes/route_name.dart';
//import 'package:url_launcher/url_launcher.dart';

class ConsultaResPage extends StatefulWidget {
  final ApiData consultaEst;
  const ConsultaResPage({super.key, required this.consultaEst});

  @override
  State<ConsultaResPage> createState() => _ConsultaResPageState();
}

class _ConsultaResPageState extends State<ConsultaResPage> {
  late Future<Consulta> consulta;
  final headers = {"Content-Type":"application/json;charset=UTF-8"};

  _ConsultaResPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Información del ticket", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18)),
          backgroundColor: const Color.fromARGB(255, 153, 86, 142),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: FutureBuilder<Consulta>(
              future: consulta,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if(snapshot.data!.estatusId == 1){
                    return Center(
                      child: Column(
                        children: <Widget>[
                          const Padding(padding: EdgeInsets.all(20.0)),
                          ListTile(
                            title: const Text("Número de ticket",style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(snapshot.data!.numero),
                          ),
                          const Divider(),
                          ListTile(
                            title: const Text("Tema",style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(snapshot.data!.topic),
                          ),
                          const Divider(),
                          ListTile(
                            title: const Text("Estatus",style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(snapshot.data!.estatus),
                          ),
                          const Divider(),
                          ListTile(
                            title: const Text("Creado",style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(snapshot.data!.creado),
                          ),
                          const Divider(),
                          InkWell(
                            //onTap: () => launchUrl(Uri.parse(snapshot.data!.link)),
                            child: const Text(
                              'Detalle',
                              style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
                            ),
                          ),
                          const Divider(),
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
                            child: Text("Error al consultar estatus: ${snapshot.data!.error}"),
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
                        const Padding(padding: EdgeInsets.all(30.0)),
                        Container(
                          height: 150,width: 200,color: Colors.red[100],alignment: Alignment.center,
                          child: Text("Error al consultar estatusss: ${snapshot.error}"),
                        ),
                        const SizedBox(height: 20),
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
              }),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    consulta = consultarEstatus();
  }

  Future<Consulta> consultarEstatus() async {
    final serviceUri = Uri.parse(widget.consultaEst.urlServicio);
    final res = await http.post(serviceUri,headers: headers, body: jsonEncode(widget.consultaEst.campos));
    final element = json.decode(res.body);
    print("Respuesta $element ");
    return Consulta.fromJson(element);
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mesadeservicio/models/tema.dart';
import 'package:mesadeservicio/routes/route_name.dart';
import 'package:mesadeservicio/utils/ruta_servicios.dart';

class EgreTemaPage extends StatefulWidget {
  static const routeName = '/egreTemaPage';

  const EgreTemaPage({super.key});

  @override
  State<EgreTemaPage> createState() => _EgreTemaPageState();
}

class _EgreTemaPageState extends State<EgreTemaPage> {
  final serviceUri = Uri.parse(RutaServicios.server + RutaServicios.egreTopicsService);
  late Future<List<Tema>> temas;

  _EgreTemaPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Egresados',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18, )),
          backgroundColor: const Color.fromARGB(255, 153, 86, 142),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Tema>>(
                future: temas,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(snapshot.data![index].nombre),
                              onTap: () {
                                switch(snapshot.data![index].pageMovil){
                                  case "egrAsesPage":
                                    Navigator.pushNamed(context,RouteName.egrAsesPage,arguments:snapshot.data![index]);
                                  case "egrCorrPage":
                                    Navigator.pushNamed(context,RouteName.egrCorrPage,arguments:snapshot.data![index]);
                                }
                              },
                            ),
                          );
                        });
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error al obtener los temas.",
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 16)),
                    );
                  }
                  return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.grey,
                      )
                  );
                }),
          );
  }

  @override
  void initState() {
    super.initState();
    temas = getTemas(serviceUri);
  }

  Future<List<Tema>> getTemas(final url) async {
    final res = await http.get(url);
    List<dynamic> list = json.decode(utf8.decode(res.bodyBytes));
    final List<Tema> temas = [];
    for (var element in list) {
      temas.add(Tema.fromJson(element));
    }
    return temas;
  }
}

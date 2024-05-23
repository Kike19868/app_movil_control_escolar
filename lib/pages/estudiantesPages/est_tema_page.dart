import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mesadeservicio/models/tema.dart';
import 'package:mesadeservicio/utils/ruta_servicios.dart';
import 'package:mesadeservicio/routes/route_name.dart';

class EstTemaPage extends StatefulWidget {
  static const routeName = '/estTemaPage';

  const EstTemaPage({super.key});

  @override
  State<EstTemaPage> createState() => _EstTemaPageState();
}

class _EstTemaPageState extends State<EstTemaPage> {
  final serviceUri = Uri.parse(RutaServicios.server + RutaServicios.estTopicsService);
  late Future<List<Tema>> temas;

  _EstTemaPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Estudiantes',
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
                                case "estBecaPage":
                                  Navigator.pushNamed(context,RouteName.estBecaPage,arguments:snapshot.data![index]);
                                case "estBTempPage":
                                  Navigator.pushNamed(context,RouteName.estBTempPage,arguments:snapshot.data![index]);
                                case "estCertParPage":
                                  Navigator.pushNamed(context,RouteName.estCertParPage,arguments:snapshot.data![index]);
                                case "estConstPage":
                                  Navigator.pushNamed(context,RouteName.estConstPage,arguments:snapshot.data![index]);
                                case "estFelicPage":
                                  Navigator.pushNamed(context,RouteName.estFelicPage,arguments:snapshot.data![index]);
                                case "estGralPage":
                                  Navigator.pushNamed(context,RouteName.estGralPage,arguments:snapshot.data![index]);
                                case "estGral2Page":
                                  Navigator.pushNamed(context,RouteName.estGral2Page,arguments:snapshot.data![index]);
                                case "estHistAcPage":
                                  Navigator.pushNamed(context,RouteName.estHistAcPage,arguments:snapshot.data![index]);
                                case "estImssPage":
                                  Navigator.pushNamed(context,RouteName.estImssPage,arguments:snapshot.data![index]);
                                case "estModSimPage":
                                  Navigator.pushNamed(context,RouteName.estModSimPage,arguments:snapshot.data![index]);
                                case "estProbAulPage":
                                  Navigator.pushNamed(context,RouteName.estProbAulPage,arguments:snapshot.data![index]);
                                case "estReinBTPage":
                                  Navigator.pushNamed(context,RouteName.estReinBTPage,arguments:snapshot.data![index]);
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

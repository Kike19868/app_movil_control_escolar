import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mesadeservicio/models/tema.dart';
import 'package:mesadeservicio/routes/route_name.dart';
import 'package:mesadeservicio/utils/ruta_servicios.dart';

class AspTemaPage extends StatefulWidget {
  const AspTemaPage({super.key});

  @override
  State<AspTemaPage> createState() => _AspTemaPageState();
}

class _AspTemaPageState extends State<AspTemaPage> {
  final serviceUri = Uri.parse(RutaServicios.server + RutaServicios.aspTopicsService);
  late Future<List<Tema>> temas;

  _AspTemaPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aspirantes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18, )),
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
                            Navigator.pushNamed(context,RouteName.aspGralPage,arguments:snapshot.data![index]);
                          },
                        ),
                      );
                    });
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error al obtener los temas: ${snapshot.error.toString()}",
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 16)),
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

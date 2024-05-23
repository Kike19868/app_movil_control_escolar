import 'package:flutter/material.dart';

class MostrarInfo extends StatelessWidget {
 
  const MostrarInfo({
    Key? key,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Mesa de Servicio', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18)),
        backgroundColor: const Color.fromARGB(255, 153, 86, 142),
        centerTitle: true,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white, opacity: 0.5),
        toolbarHeight: 50,
      ),
      
    );
  }
}
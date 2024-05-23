import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../pages/consultaTicketsPages/consulta_page.dart';


class btn_slider extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      height: 40,
      width: 150,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black12.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(10.0))
      ),

      child: TextButton(
        onPressed: (){
          Navigator.push( context,MaterialPageRoute(builder: (context) => const ConsultaPage()));
        },
        child: const Text("Ingresar",  style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
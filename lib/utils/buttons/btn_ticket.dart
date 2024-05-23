import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../pages/consultaTicketsPages/consulta_page.dart';

class btn_ticket extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      height: 60,
      width: 250,
    
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 153, 86, 142)),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))
      ),

      child: TextButton(
        onPressed: (){
          Navigator.push( context,MaterialPageRoute(builder: (context) => const ConsultaPage()));
        },
        child: Text("Consultar ticket",  style: TextStyle(color: Color.fromARGB(255, 153, 86, 142), fontSize: 20)),
      ),
    );
  }
}
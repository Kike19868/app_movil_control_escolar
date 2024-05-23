
import 'package:flutter/material.dart';
import 'package:mesadeservicio/utils/buttons/btn_ticket.dart';
import '../utils/menu_banner.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        actions: [
          PopupMenuButton<String>(
            elevation: 1,
            color: Colors.deepPurple[10],
            onSelected: selectMenuItem,
            itemBuilder: (context) => [
              menuItem(value: ' Consultar ticket', icon: Icons.book_online),
              menuItem(value: ' Notificaciones', icon: Icons.doorbell_sharp),
              menuItem(value: ' Preguntas frecuentes', icon: Icons.question_answer),
              menuItem(value: ' Acerca de mesa de servicio', icon: Icons.info_outline)
            ],
            shadowColor: Colors.amberAccent,
          )
        ],
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
                MenuBanner(),
                btn_ticket()
                
            ]
         ),
      ),
    );
  }

  PopupMenuItem<String> menuItem({value, icon}) {
    return PopupMenuItem(
      height: 30,
      textStyle: const TextStyle(color: Colors.blue),
      value: value,
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.black45),
            Text(value, style: const TextStyle(color: Colors.black45, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  void selectMenuItem(String value) {
    switch (value) {
      case 'Opcion 1':
        break;
    }
  }
}


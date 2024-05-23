import 'package:flutter/material.dart';
import 'package:mesadeservicio/models/api_data.dart';
import 'package:mesadeservicio/routes/route_name.dart';
import 'package:mesadeservicio/utils/ruta_servicios.dart';
import 'package:mesadeservicio/utils/Input_text_field.dart';
import 'button_login.dart';

class ConsultaPage extends StatefulWidget {
  const ConsultaPage({super.key});

  @override
  State<ConsultaPage> createState() => _ConsultaState();
}

class _ConsultaState extends State<ConsultaPage> {
  final _correoFocusNode = FocusNode();
  final _folioFocusNode = FocusNode();

  //Controladores
  final correo = TextEditingController();
  final numero = TextEditingController();

  @override
  void dispose() {
    _folioFocusNode.dispose();
    _correoFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
        title: const Text('Consulta tu ticket', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18, )),
          backgroundColor: const Color.fromARGB(255, 153, 86, 142),
          iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
        //Contenedor
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("assets/images/ticket.jpg", width: 250, height: 250,),
                  Text("Ingresa los datos solicitados", style: TextStyle(color: Color.fromARGB(255, 153, 86, 142), fontSize: 25),),
                  Form(
                      child: Column(
                        children: [
                          //Correo
                          InputTextField(
                              myController: correo,
                              focusNode:_correoFocusNode ,
                              onFiledSubmittedValue: (value) {},
                              keyBoardType: TextInputType.emailAddress,
                              obscureText: false,
                              hint: 'Correo',
                              onValidator: (value) {
                                return value.isEmpty ? 'Ingresa tu correo' : null;
                              }),
                          const SizedBox(height: 10),
                          
                          //Folio
                          InputTextField(
                              myController: numero ,
                              focusNode:_folioFocusNode ,
                              onFiledSubmittedValue: (value) {},
                              keyBoardType: TextInputType.text,
                              obscureText: false,
                              hint: 'Número de ticket',
                              onValidator: (value) {
                                return value.isEmpty
                                    ? 'Ingresa el número de ticket'
                                    : null;
                              })
                        ],
                      )),
                  //Boton
                  const SizedBox(height: 18),
                  RoudButton(
                    title: 'Consultar',
                    onPress: () {
                      Navigator.pushNamed(context,RouteName.consultaResPage,arguments:crearConsultaObj());
                    }),
                ],
              ),
            ),
          ),
        ));
    }

  ApiData crearConsultaObj(){
    final campos = {
      "numero":numero.text,
      "correo":correo.text,
    };

    return ApiData(
        urlServicio:RutaServicios.server + RutaServicios.consultaService,
        campos: campos
    );
  }
}

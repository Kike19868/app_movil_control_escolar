import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mesadeservicio/models/tema.dart';
import 'package:mesadeservicio/models/api_data.dart';
import 'package:mesadeservicio/utils/ruta_servicios.dart';
import 'package:mesadeservicio/utils/widgets_gral.dart';
import 'package:mesadeservicio/utils/widgets_modsim.dart';
import 'package:mesadeservicio/routes/route_name.dart';

class EstModSimPage extends StatelessWidget{
  final nombre = TextEditingController();
  final correo = TextEditingController();
  final usuario = TextEditingController();
  final modSim = TextEditingController();
  final _ticketForm = GlobalKey<FormBuilderState>();
  final Tema tema;

  EstModSimPage({super.key,required this.tema});

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: Widgets.getAppBar(tema.nombre),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: FormBuilder(
            key: _ticketForm,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Widgets.getFieldName(nombre),
                  const SizedBox(height: 10),
                  Widgets.getFieldEmail(correo),
                  const SizedBox(height: 10),
                  Widgets.getFieldUsuario(usuario),
                  const SizedBox(height: 30),
                  WidgetsModSimBT.getFieldModulo(modSim),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(child:
                      MaterialButton(
                        color: const Color(0xFFEB5F62),
                        onPressed: () {
                          _ticketForm.currentState?.reset();
                          Navigator.pushReplacementNamed(context,RouteName.homePage);
                        },
                        child: const Text('Cancelar'),
                      )
                      ),
                      const SizedBox(width: 30),
                      Expanded(child: MaterialButton(
                        color: const Color(0xFFB1CD52),
                        onPressed: () {
                          if(_ticketForm.currentState != null){
                            final validForm = _ticketForm.currentState!.validate();
                            if(validForm){
                              _ticketForm.currentState?.saveAndValidate();
                              Navigator.pushNamed(context,RouteName.respuestaPage,arguments:crearTicketObj());
                              _ticketForm.currentState?.reset();
                            }
                          }
                        },
                        child: const Text('Crear ticket'),
                      )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  ApiData crearTicketObj(){
    final campos = {
      "nombre":nombre.text,
      "correo":correo.text,
      "usuario":usuario.text,
      "modSim":modSim.text,
      "idTema":tema.id
    };

    return ApiData(
        urlServicio: RutaServicios.server + RutaServicios.estModSimService,
        campos: campos
    );
  }
}
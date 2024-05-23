import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mesadeservicio/models/tema.dart';
import 'package:mesadeservicio/models/api_data.dart';
import 'package:mesadeservicio/utils/ruta_servicios.dart';
import 'package:mesadeservicio/utils/widgets_gral.dart';
import 'package:mesadeservicio/routes/route_name.dart';

class EstProbAulPage extends StatelessWidget{
  final nombre = TextEditingController();
  final correo = TextEditingController();
  final usuario = TextEditingController();
  final curp = TextEditingController();
  final asunto = TextEditingController();
  final duda = TextEditingController();
  final _ticketForm = GlobalKey<FormBuilderState>();
  final Tema tema;

  EstProbAulPage({super.key,required this.tema});

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
                  Widgets.getFieldName(nombre),
                  const SizedBox(height: 10),
                  Widgets.getFieldEmail(correo),
                  const SizedBox(height: 10),
                  Widgets.getFieldUsuario(usuario),
                  const SizedBox(height: 10),
                  Widgets.getFieldCURP(curp),
                  const SizedBox(height: 10),
                  Widgets.getFieldAsunto(asunto),
                  const SizedBox(height: 10),
                  Widgets.getFieldDescripcion(duda),
                  const SizedBox(height: 10),
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
      "curp":curp.text,
      "asunto":asunto.text,
      "duda":duda.text,
      "idTema":tema.id
    };

    return ApiData(
        urlServicio: RutaServicios.server + RutaServicios.estProbAulService,
        campos: campos
    );
  }
}
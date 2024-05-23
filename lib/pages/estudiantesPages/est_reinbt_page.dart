import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mesadeservicio/models/tema.dart';
import 'package:mesadeservicio/models/api_data.dart';
import 'package:mesadeservicio/utils/ruta_servicios.dart';
import 'package:mesadeservicio/utils/widgets_gral.dart';
import 'package:mesadeservicio/utils/widgets_reinbt.dart';
import 'package:mesadeservicio/routes/route_name.dart';

class EstReinBTPage extends StatefulWidget{
  final Tema tema;

  const EstReinBTPage({super.key, required this.tema});

  @override
  State<EstReinBTPage> createState() => _EstReinBTPageState();
}

class _EstReinBTPageState extends State<EstReinBTPage> {
  final nombre = TextEditingController();
  final correo = TextEditingController();
  final usuario = TextEditingController();
  final ultModCur = TextEditingController();
  final date = TextEditingController();
  final _ticketForm = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: Widgets.getAppBar(widget.tema.nombre),
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
                  WidgetsReinBT.getFieldModulo(ultModCur),
                  const SizedBox(height: 30),
                  getFieldDate(date),
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

  Widget getFieldDate(TextEditingController date){
    return TextField(
      controller: date,
      readOnly: true,
      decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today_rounded),labelText: "Selecciona fecha"),
      onTap: () async{
        DateTime? picketDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year - 1),
            lastDate: DateTime.now()
        );

        if(picketDate != null){
          setState(() {
            String day = picketDate.day.toString();
            String month = picketDate.month.toString();
            String year = picketDate.year.toString();
            date.text = "$day/$month/$year";
          });
        }
      },
    );
  }

  ApiData crearTicketObj(){
    final campos = {
      "nombre":nombre.text,
      "correo":correo.text,
      "usuario":usuario.text,
      "fecSolBTemp":date.text,
      "ultModCursado":ultModCur.text,
      "idTema":widget.tema.id
    };

    return ApiData(
        urlServicio: RutaServicios.server + RutaServicios.estReinBTService,
        campos: campos
    );
  }
}
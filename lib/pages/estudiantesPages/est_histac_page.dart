import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mesadeservicio/models/tema.dart';
import 'package:mesadeservicio/models/api_data.dart';
import 'package:mesadeservicio/utils/field_validator.dart';
import 'package:mesadeservicio/utils/ruta_servicios.dart';
import 'package:mesadeservicio/utils/widgets_gral.dart';
import 'package:mesadeservicio/utils/widgets_histac.dart';
import 'package:mesadeservicio/routes/route_name.dart';

class EstHistAcPage extends StatefulWidget{
  final Tema tema;
  const EstHistAcPage({super.key, required this.tema});

  @override
  State<EstHistAcPage> createState() => _EstHistAcPageState();
}

class _EstHistAcPageState extends State<EstHistAcPage> {
  final nombre = TextEditingController();
  final correo = TextEditingController();
  final usuario = TextEditingController();
  final reqSello = TextEditingController();
  bool? motLaboral = false;
  bool? motSalud = false;
  bool? motBeca = false;
  bool? motEgreso = false;
  bool? motCambMod = false;
  bool? motOtro = false;
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
                  Widgets.getFieldName(nombre),
                  const SizedBox(height: 10),
                  Widgets.getFieldEmail(correo),
                  const SizedBox(height: 10),
                  Widgets.getFieldUsuario(usuario),
                  const SizedBox(height: 10),
                  getMotivoHistAc(),
                  const SizedBox(height: 10),
                  WidgetsHistAc.getFieldRequiereSello(reqSello),
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
                      const SizedBox(width: 20),
                      Expanded(child: MaterialButton(
                        color: const Color(0xFFB1CD52),
                        onPressed: () {
                          if(_ticketForm.currentState != null){
                            final validForm = _ticketForm.currentState!.validate();
                            if(validForm){
                              _ticketForm.currentState?.saveAndValidate();

                              if(FieldValidator.validateMotivoHistAc(motLaboral,motSalud,motBeca,motEgreso,motCambMod,motOtro)){
                                Navigator.pushNamed(context,RouteName.respuestaPage,arguments:crearTicketObj());
                                _ticketForm.currentState?.reset();
                              }else{
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: const Text('Error'),
                                      content: const Text('Debe indicar el motivo'),
                                      actions: <Widget>[TextButton(onPressed: () => Navigator.pop(context, 'OK'), child: const Text('OK')),
                                      ],
                                    )
                                );
                              }
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

  Widget getMotivoHistAc() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Motivo de la solicitud", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        CheckboxListTile(
          title: const Text("Laboral"),
          controlAffinity: ListTileControlAffinity.leading,
          value: motLaboral,
          onChanged: (bool? value) {
            setState(() {
              motLaboral = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Salud"),
          controlAffinity: ListTileControlAffinity.leading,
          value: motSalud,
          onChanged: (bool? value) {
            setState(() {
              motSalud = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Beca"),
          controlAffinity: ListTileControlAffinity.leading,
          value: motBeca,
          onChanged: (bool? value) {
            setState(() {
              motBeca = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Egreso"),
          controlAffinity: ListTileControlAffinity.leading,
          value: motEgreso,
          onChanged: (bool? value) {
            setState(() {
              motEgreso = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Cambio de modalidad"),
          controlAffinity: ListTileControlAffinity.leading,
          value: motCambMod,
          onChanged: (bool? value) {
            setState(() {
              motCambMod = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Otro"),
          controlAffinity: ListTileControlAffinity.leading,
          value: motOtro,
          onChanged: (bool? value) {
            setState(() {
              motOtro = value;
            });
          },
        )
      ],
    );
  }

  ApiData crearTicketObj(){
    final campos = {
      "nombre":nombre.text,
      "correo":correo.text,
      "usuario":usuario.text,
      "motConstHistLaboral": motLaboral == true ? '1':'0',
      "motConstHistSalud": motSalud == true ? '1':'0',
      "motConstHistBeca": motBeca == true ? '1':'0',
      "motConstHistEgreso": motEgreso == true ? '1':'0',
      "motConstHistCambMod": motCambMod == true ? '1':'0',
      "motConstHistOtro": motOtro == true ? '1':'0',
      "otroMotConstHist":"",
      "requiereSello":reqSello.text,
      "idTema":widget.tema.id
    };

    return ApiData(
        urlServicio: RutaServicios.server + RutaServicios.estHistAcService,
        campos: campos
    );
  }
}

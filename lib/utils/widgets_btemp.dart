import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

enum Periodo {
  mini('', 'Selecciona...'),
  tresM('1-3', 'De 1 a 3 meses'),
  seisM('3-6', 'De 3 a 6 meses'),
  nueveM('6-9', 'De 6 a 9 meses');

  const Periodo(this.id, this.value);
  final String id;
  final String value;
}

enum Persona {
  mini('', 'Selecciona...'),
  est('est', 'Estudiante'),
  pot('pot', 'Padre o tutor');

  const Persona(this.id, this.value);
  final String id;
  final String value;
}

enum Motivo {
  mini('', 'Selecciona...'),
  personal('mbtpe', 'Personales'),
  economico('mbtec', 'Económicos'),
  salud('mbtsa', 'Salud'),
  laboral('mbtla', 'Laboral'),
  tecnologico('mbtte', 'Tecnológicos'),
  otro('mbtte','Otro');

  const Motivo(this.id, this.value);
  final String id;
  final String value;
}

class WidgetsBT {
  static Widget getPeriodosBT(TextEditingController periodo){
    String? selectAses = "";
    return Center(
      child: Column(
        children: <Widget>[
          DropdownButtonFormField(
            value: selectAses,
            validator: FormBuilderValidators.required(errorText: "El periodo es requerido"),
            decoration: const InputDecoration(
                labelText: "Periodo",
                border: OutlineInputBorder()
            ),
            icon: const Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.blue,
            ),
            dropdownColor: Colors.grey,
            isExpanded: true,
            items: Periodo.values.map<DropdownMenuItem<String>>( (Periodo mot) {
              return DropdownMenuItem<String>(value: mot.id,child: Text(mot.value));
            }).toList(),
            onChanged: <String>(value){
              periodo.value = TextEditingValue(
                text: value,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: periodo.text.length),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  static Widget getPersonalSol(TextEditingController persona){
    String? selectAses = "";
    return Center(
      child: Column(
        children: <Widget>[
          DropdownButtonFormField(
            value: selectAses,
            validator: FormBuilderValidators.required(errorText: "La persona es requerida"),
            decoration: const InputDecoration(
                labelText: "Persona que solicita la baja",
                border: OutlineInputBorder()
            ),
            icon: const Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.blue,
            ),
            dropdownColor: Colors.grey,
            isExpanded: true,
            items: Persona.values.map<DropdownMenuItem<String>>( (Persona mot) {
              return DropdownMenuItem<String>(value: mot.id,child: Text(mot.value));
            }).toList(),
            onChanged: <String>(value){
              persona.value = TextEditingValue(
                text: value,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: persona.text.length),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  static Widget getMotivosBT(TextEditingController motivo){
    String? selectAses = "";
    return Center(
      child: Column(
        children: <Widget>[
          DropdownButtonFormField(
            value: selectAses,
            validator: FormBuilderValidators.required(errorText: "La persona es requerida"),
            decoration: const InputDecoration(
                labelText: "Motivo de la baja temporal",
                border: OutlineInputBorder()
            ),
            icon: const Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.blue,
            ),
            dropdownColor: Colors.grey,
            isExpanded: true,
            items: Motivo.values.map<DropdownMenuItem<String>>( (Motivo mot) {
              return DropdownMenuItem<String>(value: mot.id,child: Text(mot.value));
            }).toList(),
            onChanged: <String>(value){
              motivo.value = TextEditingValue(
                text: value,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: motivo.text.length),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
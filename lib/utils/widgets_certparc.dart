import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

enum Motivo {
  mini('', 'Selecciona motivo'),
  laboral('mcplab', 'Laboral'),
  cambioMod('mcpme', 'Cambio de modalidad educativa');

  const Motivo(this.id, this.value);
  final String id;
  final String value;
}

class WidgetsCertParc{
  static Widget getMotivosCertPar(TextEditingController motivo){
    String? selectAses = "";
    return Center(
      child: Column(
        children: <Widget>[
          DropdownButtonFormField(
            value: selectAses,
            validator: FormBuilderValidators.required(errorText: "El motivo es requerido"),
            decoration: const InputDecoration(
                labelText: "Motivo de la solicitud",
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
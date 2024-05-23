import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

enum MotivoCorrCert{
  mini('', 'Selecciona un motivo'),
  mcan('can', 'Corrección de acentos en el nombre del certificado'),
  mcne('cne', 'Corrección del nombre en el certificado'),
  mcce('cce', 'Corrección del CURP en el certificado'),
  mcnc('cnc', 'Corrección del nombre y CURP en el certificado');

  const MotivoCorrCert(this.id, this.value);
  final String id;
  final String value;
}

class WidgetsCorrCert {
  static Widget getMotivoCorrCert(TextEditingController motivo){
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
          items: MotivoCorrCert.values.map<DropdownMenuItem<String>>( (MotivoCorrCert mot) {
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
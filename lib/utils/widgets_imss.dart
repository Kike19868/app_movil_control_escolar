import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

enum Imss {
  mini('', 'Selecciona motivo'),
  alta('altaIMSS', 'Alta'),
  baja('bajaIMSS', 'Baja');

  const Imss(this.id, this.value);
  final String id;
  final String value;
}

class WidgetsIMSS {
  static Widget getFieldMotivos(TextEditingController motivo){
    String? selectAses = "";
    return Center(
      child: Column(
        children: <Widget>[
          DropdownButtonFormField(
            value: selectAses,
            validator: FormBuilderValidators.required(errorText: "Motivo es requerido"),
            decoration: const InputDecoration(
                labelText: "Motivo solicitud",
                border: OutlineInputBorder()
            ),
            icon: const Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.blue,
            ),
            dropdownColor: Colors.grey,
            isExpanded: true,
            items: Imss.values.map<DropdownMenuItem<String>>( (Imss mot) {
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

  static Widget getFieldNSS(TextEditingController numUsuario) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'NSS (Número de Seguridad Social)',border: OutlineInputBorder()),
      keyboardType: TextInputType.number,
      maxLength: 11,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: "NSS es requerido"),
        FormBuilderValidators.numeric(errorText: "Ingresar solo numeros"),
        FormBuilderValidators.match(r"^\d{11}$", errorText: "Debe ingresar 11 números")
      ]
      ),
      controller: numUsuario,
    );
  }
}
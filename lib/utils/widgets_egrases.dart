import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

enum MotivoAsesCert{
  mini('', 'Selecciona un motivo'),
  macm('acm', 'Se ha concluido de manera satisfactoria los 23 módulos'),
  macr('acr', 'Cuando recibiré el certificado'),
  marc('arc', 'No he recibido mi certificado'),
  manc('anc', 'No se cuenta con clave de acceso y se requiere una copia del certificado');

  const MotivoAsesCert(this.id, this.value);
  final String id;
  final String value;
}

class WidgetsAsesCert {
  static Widget getMotivoAsesCert(TextEditingController motivo){
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
          items: MotivoAsesCert.values.map<DropdownMenuItem<String>>( (MotivoAsesCert mot) {
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
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

enum ReqSello {
  mini('', 'Selecciona ...'),
  si('si', 'Si'),
  no('no', 'No');

  const ReqSello(this.id, this.value);
  final String id;
  final String value;
}

class WidgetsHistAc {
  static Widget getFieldRequiereSello(TextEditingController reqSello){
    String? selectAses = "";
    return Center(
      child: Column(
        children: <Widget>[
          DropdownButtonFormField(
            value: selectAses,
            validator: FormBuilderValidators.required(errorText: "Campo requerido"),
            decoration: const InputDecoration(
                labelText: "¿Requiere sello?",
                border: OutlineInputBorder()
            ),
            icon: const Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.blue,
            ),
            dropdownColor: Colors.grey,
            isExpanded: true,
            items: ReqSello.values.map<DropdownMenuItem<String>>( (ReqSello mot) {
              return DropdownMenuItem<String>(value: mot.id,child: Text(mot.value));
            }).toList(),
            onChanged: <String>(value){
              reqSello.value = TextEditingValue(
                text: value,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: reqSello.text.length),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
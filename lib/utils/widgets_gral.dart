import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mesadeservicio/utils/field_validator.dart';

class Widgets {
  static PreferredSizeWidget getAppBar(final nombre) {
    return AppBar(
      title: Text(nombre,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18, )),
      backgroundColor: const Color.fromARGB(255, 153, 86, 142),
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
    );
  }

  static Widget getFieldName(TextEditingController nombre) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Nombre completo',
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
      validator: FormBuilderValidators.required(errorText: "Nombre es requerido"),
      controller: nombre
    );
  }

  static Widget getFieldEmail(TextEditingController email) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Correo electrónico',border: OutlineInputBorder()),
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(!FieldValidator.validateEmail(value!)){
          return "Correo no valido";
        }
        return null;
      },
      controller: email,
    );
  }

  static Widget getFieldUsuario(TextEditingController numUsuario) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Número de usuario',border: OutlineInputBorder()),
      keyboardType: TextInputType.number,
      validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(errorText: "Número de usuario es requerido"),
          FormBuilderValidators.numeric(errorText: "Ingresar solo numeros")
        ]
      ),
      controller: numUsuario,
    );
  }

  static Widget getFieldCURP(TextEditingController curp) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'CURP',border: OutlineInputBorder()),
      maxLength: 18,
      validator: (value) {
        if (!FieldValidator.validateCurp(value!)) {
          return "CURP no valida";
        }
        return null;
      },
      controller: curp,
    );
  }

  static Widget getFieldAsunto(TextEditingController asunto) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Asunto',border: OutlineInputBorder()),
      validator: FormBuilderValidators.required(errorText: "Asunto es requerido"),
      controller: asunto,
      maxLength: 50,
    );
  }

  static Widget getFieldDescripcion(TextEditingController desGral) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Descripción de la duda',border: OutlineInputBorder()),
      validator: FormBuilderValidators.required(errorText: "Descripción es requerida"),
      controller: desGral,
      autocorrect: true,
      maxLines: 4,
      maxLength: 250,
      keyboardType: TextInputType.text,
    );
  }

  static Widget getFieldComentarios(TextEditingController comentarios) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Comentarios',border: OutlineInputBorder()),
      validator: FormBuilderValidators.required(errorText: "El campo es requerido"),
      controller: comentarios,
      autocorrect: true,
      maxLines: 4,
      maxLength: 250,
      keyboardType: TextInputType.text,
    );
  }

  static Widget getFieldNumeroTicket(TextEditingController number) {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'Número de ticket',border: OutlineInputBorder()),
        validator: FormBuilderValidators.required(errorText: "Número es requerido"),
        controller: number
    );
  }
}
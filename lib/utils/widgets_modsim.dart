import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

enum ModSim {
  mini('', 'Selecciona módulo'),
  mUno('M1', 'M1'),
  mDos('M2', 'M2'),
  mTres('M3', 'M3'),
  mCuatro('M4', 'M4'),
  mCinco('M5', 'M5'),
  mSeis('M6', 'M6'),
  mSiete('M7', 'M7'),
  mOcho('M8', 'M8'),
  mNueve('M9', 'M9'),
  mDiez('M10', 'M10'),
  mOnce('M11', 'M11'),
  mDoce('M12', 'M12'),
  mTrece('M13', 'M13'),
  mCatorce('M14', 'M14'),
  mQuince('M15', 'M15'),
  mDieciseis('M16', 'M16'),
  mDiecisiete('M17', 'M17'),
  mDieciocho('M18', 'M18'),
  mDiecinueve('M19', 'M19'),
  mVeinte('M20', 'M20'),
  mVeintiuno('M21', 'M21');

  const ModSim(this.id, this.value);
  final String id;
  final String value;
}

class WidgetsModSimBT {
  static Widget getFieldModulo(TextEditingController modulo){
    String? selectAses = "";
    return Center(
      child: Column(
        children: <Widget>[
          DropdownButtonFormField(
            value: selectAses,
            validator: FormBuilderValidators.required(errorText: "Módulo es requerido"),
            decoration: const InputDecoration(
                labelText: "Módulo a recursar:",
                border: OutlineInputBorder()
            ),
            icon: const Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.blue,
            ),
            dropdownColor: Colors.grey,
            isExpanded: true,
            items: ModSim.values.map<DropdownMenuItem<String>>( (ModSim mot) {
              return DropdownMenuItem<String>(value: mot.id,child: Text(mot.value));
            }).toList(),
            onChanged: <String>(value){
              modulo.value = TextEditingValue(
                text: value,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: modulo.text.length),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
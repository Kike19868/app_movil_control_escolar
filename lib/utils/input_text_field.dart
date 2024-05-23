import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.myController,
    required this.focusNode,
    required this.onFiledSubmittedValue,
    required this.keyBoardType,
    required this.obscureText,
    required this.hint,
    required this.onValidator,
    this.enable = true,
  });

  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFiledSubmittedValue;
  final FormFieldValidator onValidator;
  final TextInputType keyBoardType;
  final String hint;
  final bool obscureText;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextFormField(
        controller: myController,
        focusNode: focusNode,
        obscureText: obscureText,
        onFieldSubmitted: onFiledSubmittedValue,
        validator: onValidator,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
            borderSide:BorderSide(color: Color.fromARGB(255, 237, 237, 237)),
            borderRadius: BorderRadius.all(Radius.circular(5))),
            focusedBorder: const OutlineInputBorder(
                borderSide:BorderSide(color: Color.fromARGB(255, 242, 242, 242)),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: hint,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 66, 64, 64),
                fontSize: 13,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}

import 'package:flutter/material.dart';

String defaultValidator(String value) {
  print(value.isEmpty);
  return value.isEmpty == true ? 'Por favor preencha este campo' : null;
}

class FormInput extends StatelessWidget {
  FormInput({
    this.key,
    this.hintText,
    this.obscureText,
    this.validator,
    this.onSaved,
    this.onChange,
    this.onFieldSubmitted,
    this.keyBoardType,
    this.textInputAction,
    this.icon,
    this.current,
  });

  final key;
  final String hintText;
  final bool obscureText;
  final Function validator;
  final Function onSaved;
  final Function onChange;
  final Function onFieldSubmitted;
  final TextInputType keyBoardType;
  final TextInputAction textInputAction;
  final Widget icon;
  final current;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontSize: 16),
      obscureText: obscureText == true ? true : false,
      cursorColor: Colors.white,
      keyboardType: keyBoardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
        prefixIcon: icon,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white60),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white60),
        ),
      ),
      validator: (value) {
        print(value);
        return this.validator != null
            ? this.validator(value)
            : defaultValidator(value);
      },
      onChanged: (text) => this.onChange(text),
      onSaved: (text) => this.onSaved(text),
      onFieldSubmitted: (text) => this.onFieldSubmitted(),
    );
  }
}

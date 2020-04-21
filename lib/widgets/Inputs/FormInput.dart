import 'package:flutter/material.dart';

String defaultValidator(String value) {
  print(value.isEmpty);
  return value.isEmpty == true ? 'Por favor preencha este campo' : null;
}

class FormInput extends StatefulWidget {
  FormInput({
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
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontSize: 16),
      obscureText: widget.obscureText == true ? true : false,
      cursorColor: Colors.white,
      keyboardType: widget.keyBoardType,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.white70),
        prefixIcon: widget.icon,
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
        return this.widget.validator != null
            ? this.widget.validator(value)
            : defaultValidator(value);
      },
      onChanged: (text) => this.widget.onChange(text),
      onSaved: (text) => this.widget.onSaved(text),
      onFieldSubmitted: (text) => this.widget.onFieldSubmitted(),
    );
  }
}

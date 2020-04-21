import 'package:flutter/material.dart';
import 'package:my_mind/widgets/Inputs/FormInput.dart';
import 'package:my_mind/widgets/Buttons/FormButton.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _setEmail(String text) => setState(() => _email = text);
  void _setPassword(String text) => setState(() => _password = text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [const Color(0xFFb9046e), const Color(0xFF570388)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 300,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white70),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.white60,
                          size: 30,
                        ),
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
                      validator: (text) {
                        if (text.isEmpty) return 'Digite seu email!';
                        Pattern pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = new RegExp(pattern);
                        if (!regex.hasMatch(text))
                          return 'Enter Valid Email';
                        else
                          return null;
                      },
                      onChanged: _setEmail,
                      // onFieldSubmitted: (text) => this.widget.onFieldSubmitted(),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 300,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: TextFormField(
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        obscureText: true,
                        cursorColor: Colors.white,
                        textInputAction: TextInputAction.send,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 5),
                          hintText: 'Senha',
                          hintStyle: TextStyle(color: Colors.white70),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.white60,
                            size: 30,
                          ),
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
                        validator: (value) => value.isEmpty
                            ? 'E necessario sua senha!'
                            : value.length < 8
                                ? 'A senha deve ter no minimo 8 caracteres!'
                                : null,
                        onChanged: _setPassword
                        // onFieldSubmitted: (text) => this.widget.onFieldSubmitted(),
                        ),
                  ),
                  Container(
                      width: 300,
                      height: 48,
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: FormButton(
                        text: 'Entrar',
                        onPressed: () => _formKey.currentState.validate(),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

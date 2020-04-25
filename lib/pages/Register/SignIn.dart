import 'package:flutter/material.dart';
import 'package:my_mind/widgets/Buttons/FormButton.dart';
import 'package:my_mind/utils/validators/formValidators.dart';

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
        // color: Color(0xFF005bEA),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [const Color(0xFF003891), const Color(0xFF0063FF)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 300,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white, fontSize: 14),
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
                      validator: emailValidator,
                      onChanged: _setEmail,

                      // onFieldSubmitted: (text) => this.widget.onFieldSubmitted(),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 300,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: TextFormField(
                        style: TextStyle(color: Colors.white, fontSize: 14),
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
                        validator: passwordValidator,
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
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              textColor: Colors.white,
              child: Text(
                'Criar conta!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, 'SignUp'),
            )
          ],
        ),
      ),
    );
  }
}

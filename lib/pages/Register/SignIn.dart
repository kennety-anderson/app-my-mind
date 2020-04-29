import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:my_mind/customs/BoxDecoration/SimpleGradient.dart';
import 'package:my_mind/customs/InputDecoration/InputOutlineIcon.dart';
import 'package:my_mind/widgets/Buttons/FormButton.dart';
import 'package:my_mind/utils/validators/formValidators.dart';

Future<dynamic> authentication(String email, String password) async {
  final http.Response response = await http.post(
    '${DotEnv().env['URL_AUTHENTICATION']}/auth',
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  return response.statusCode == 200
      ? json.decode(response.body)
      : throw 'Usuario ou senha invalidos!';
}

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
      body: Builder(
        builder: (context) => Container(
          alignment: Alignment.center,
          decoration: simpleBoxDecorationGradient(),
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
                        decoration: inputOutlineIcon(
                          'Email',
                          Icon(
                            Icons.mail_outline,
                            size: 30,
                            color: Colors.white60,
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
                          decoration: inputOutlineIcon(
                            'Senha',
                            Icon(
                              Icons.lock_outline,
                              size: 30,
                              color: Colors.white60,
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
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Aguarde por favor!'),
                            ));
                            try {
                              dynamic response =
                                  await authentication(_email, _password);

                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                              await prefs.setString(
                                  'accessToken', response['accessToken']);

                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  'Main', (Route<dynamic> route) => false);
                            } catch (err) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                err.toString(),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                ),
                              )));
                            }
                          }
                        },
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
                onPressed: () => Navigator.of(context).pushNamed('SignUp'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

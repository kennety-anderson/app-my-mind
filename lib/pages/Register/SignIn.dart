import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:my_mind/customs/BoxDecoration/SimpleGradient.dart';
import 'package:my_mind/widgets/Buttons/FormButton.dart';
import 'package:my_mind/utils/classes/HiddenBehavior.dart';
import 'package:my_mind/utils/validators/formValidators.dart';
import 'package:my_mind/utils/fildFocusChange.dart';
import 'package:my_mind/utils/simpleSnackBar.dart';

Future<dynamic> authentication(
    BuildContext context, String email, String password) async {
  snackBar(context, 'Aguarde por favor!');

  final http.Response response = await http.post(
    '${DotEnv().env['URL_AUTHENTICATION']}/auth',
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    dynamic data = jsonDecode(response.body);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('accessToken', data['accessToken']);

    return Navigator.of(context)
        .pushNamedAndRemoveUntil('Main', (Route<dynamic> route) => false);
  }
  return snackBar(context, 'Usuario ou senha invalidos!', color: Colors.red);
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email;
  String _password;

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
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
            children: <Widget>[
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Entrar',
                          style: TextStyle(color: Colors.white, fontSize: 38),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Bem vindo!',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.assignment_ind,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(65),
                      topRight: Radius.circular(65),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: ScrollConfiguration(
                      behavior: HiddenBehavior(),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                // SizedBox(height: 0),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.lightBlue[200],
                                          blurRadius: 20,
                                          offset: Offset(0, 10))
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom:
                                                BorderSide(color: Colors.grey),
                                          ),
                                        ),
                                        child: TextFormField(
                                          cursorColor: Colors.lightBlue,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                            hintText: 'Email',
                                            border: InputBorder.none,
                                          ),
                                          validator: emailValidator,
                                          focusNode: _emailFocus,
                                          onChanged: _setEmail,
                                          onFieldSubmitted: (text) =>
                                              fieldFocusChange(context,
                                                  _emailFocus, _passwordFocus),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom:
                                                BorderSide(color: Colors.grey),
                                          ),
                                        ),
                                        child: TextFormField(
                                          obscureText: true,
                                          cursorColor: Colors.lightBlue,
                                          textInputAction: TextInputAction.send,
                                          decoration: InputDecoration(
                                            hintText: 'Senha',
                                            border: InputBorder.none,
                                          ),
                                          validator: passwordValidator,
                                          focusNode: _passwordFocus,
                                          onChanged: _setPassword,
                                          onFieldSubmitted: (text) => _formKey
                                                  .currentState
                                                  .validate()
                                              ? authentication(
                                                  context, _email, _password)
                                              : null,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                FlatButton(
                                  textColor: Colors.grey,
                                  child: Text(
                                    'Esqueceu sua senha?',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () => {},
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 65,
                                  width: 250,
                                  child: FormButton(
                                    text: 'Entrar',
                                    onPressed: () =>
                                        _formKey.currentState.validate()
                                            ? authentication(
                                                context, _email, _password)
                                            : null,
                                  ),
                                ),
                                SizedBox(height: 10),
                                FlatButton(
                                  textColor: Colors.grey,
                                  child: Text(
                                    'Criar conta!',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () =>
                                      Navigator.of(context).pushNamed('SignUp'),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:my_mind/customs/BoxDecoration/SimpleGradient.dart';
import 'package:my_mind/widgets/Buttons/FormButton.dart';
import 'package:my_mind/utils/classes/HiddenBehavior.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:my_mind/utils/validators/formValidators.dart';
import 'package:my_mind/utils/fildFocusChange.dart';
import 'package:my_mind/utils/simpleSnackBar.dart';

Future<dynamic> createCustomer(BuildContext context, String name, String email,
    String cpf, String birthdate, String password) async {
  snackBar(context, 'Aguarde por favor!');

  final http.Response response = await http.post(
    '${DotEnv().env['URL_CRUD_CUSTOMERS']}/customers',
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'cpf': cpf,
      'birthdate': birthdate,
      'password': password,
    }),
  );

  switch (response.statusCode) {
    case 200:
      {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Conta criada com sucesso!'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('SignIn');
                  },
                ),
              ],
            );
          },
        );
      }
      break;
    case 422:
      {
        snackBar(context, 'Email já vinculado a uma conta existente!');
      }
      break;
    case 400:
      {
        snackBar(context, 'Erro, verifique os dados enviados!');
      }
      break;
    default:
      {
        snackBar(context, 'Erro, por favor tente mais tarde!');
      }
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _name;
  String _email;
  String _cpf;
  String _birthdate;
  String _password;

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _cpfFocus = FocusNode();
  final FocusNode _birthdateFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _setName(String text) => setState(() => _name = text);
  void _setEmail(String text) => setState(() => _email = text);
  void _setCpf(String text) => setState(() => _cpf = text);
  void _setBirthdate(String text) => setState(() => _birthdate = text);
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
                          'Registrar',
                          style: TextStyle(color: Colors.white, fontSize: 38),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'My mind!',
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
                  )
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
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: ScrollConfiguration(
                      behavior: HiddenBehavior(),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  // SizedBox(height: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
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
                                              bottom: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          child: TextFormField(
                                            cursorColor: Colors.lightBlue,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                              hintText: 'Nome',
                                              border: InputBorder.none,
                                            ),
                                            validator: nameValidator,
                                            focusNode: _nameFocus,
                                            onChanged: _setName,
                                            onFieldSubmitted: (text) =>
                                                fieldFocusChange(context,
                                                    _nameFocus, _emailFocus),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          child: TextFormField(
                                            cursorColor: Colors.lightBlue,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                              hintText: 'Email',
                                              border: InputBorder.none,
                                            ),
                                            validator: emailValidator,
                                            focusNode: _emailFocus,
                                            onChanged: _setEmail,
                                            onFieldSubmitted: (text) =>
                                                fieldFocusChange(context,
                                                    _emailFocus, _cpfFocus),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          child: TextFormField(
                                            cursorColor: Colors.lightBlue,
                                            keyboardType: TextInputType.number,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                              hintText: 'CPF',
                                              border: InputBorder.none,
                                            ),
                                            validator: (text) =>
                                                !CPFValidator.isValid(text)
                                                    ? 'CPF invalido!'
                                                    : null,
                                            focusNode: _cpfFocus,
                                            onChanged: _setCpf,
                                            onFieldSubmitted: (text) =>
                                                fieldFocusChange(context,
                                                    _cpfFocus, _birthdateFocus),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          child: TextFormField(
                                            cursorColor: Colors.lightBlue,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                              hintText: 'Data de nascimento',
                                              border: InputBorder.none,
                                            ),
                                            validator: dateValidator,
                                            focusNode: _birthdateFocus,
                                            onChanged: _setBirthdate,
                                            onFieldSubmitted: (text) =>
                                                fieldFocusChange(
                                                    context,
                                                    _birthdateFocus,
                                                    _passwordFocus),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          child: TextFormField(
                                            cursorColor: Colors.lightBlue,
                                            obscureText: true,
                                            textInputAction:
                                                TextInputAction.send,
                                            decoration: InputDecoration(
                                              hintText: 'Senha',
                                              border: InputBorder.none,
                                            ),
                                            validator: passwordValidator,
                                            focusNode: _passwordFocus,
                                            onChanged: _setPassword,
                                            onFieldSubmitted: (text) =>
                                                _formKey.currentState.validate()
                                                    ? createCustomer(
                                                        context,
                                                        _name,
                                                        _email,
                                                        _cpf,
                                                        _birthdate,
                                                        _password)
                                                    : null,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 65,
                                    width: 250,
                                    child: FormButton(
                                      text: 'Registrar!',
                                      onPressed: () =>
                                          _formKey.currentState.validate()
                                              ? createCustomer(
                                                  context,
                                                  _name,
                                                  _email,
                                                  _cpf,
                                                  _birthdate,
                                                  _password)
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
                                    onPressed: () => Navigator.of(context)
                                        .pushNamed('SignIn'),
                                  )
                                ],
                              ))
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

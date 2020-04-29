import 'package:flutter/material.dart';
import 'package:my_mind/customs/BoxDecoration/SimpleGradient.dart';
import 'package:my_mind/customs/InputDecoration/InputOutlineIcon.dart';
import 'package:my_mind/widgets/Buttons/FormButton.dart';
import 'package:my_mind/utils/validators/formValidators.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: simpleBoxDecorationGradient(),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                cursorColor: Colors.white,
                                textInputAction: TextInputAction.next,
                                decoration: inputOutlineIcon(
                                  'Nome',
                                  Icon(
                                    Icons.person_outline,
                                    size: 30,
                                    color: Colors.white60,
                                  ),
                                ),
                                validator: nameValidator,
                                // onChanged: _setEmail,
                                // onFieldSubmitted: (text) => this.widget.onFieldSubmitted(),
                              ),
                            ),
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
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
                                // onChanged: _setEmail,
                                // onFieldSubmitted: (text) => this.widget.onFieldSubmitted(),
                              ),
                            ),
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration: inputOutlineIcon(
                                  'CPF',
                                  Icon(
                                    Icons.assignment_ind,
                                    size: 30,
                                    color: Colors.white60,
                                  ),
                                ),
                                validator: (text) => !CPFValidator.isValid(text)
                                    ? 'CPF invalido!'
                                    : null,
                                // onChanged: _setEmail,
                                // onFieldSubmitted: (text) => this.widget.onFieldSubmitted(),
                              ),
                            ),
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                decoration: inputOutlineIcon(
                                  'Data de nascimento',
                                  Icon(
                                    Icons.date_range,
                                    size: 30,
                                    color: Colors.white60,
                                  ),
                                ),
                                validator: dateValidator,
                                // onChanged: _setEmail,
                                // onFieldSubmitted: (text) => this.widget.onFieldSubmitted(),
                              ),
                            ),
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                cursorColor: Colors.white,
                                obscureText: true,
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
                                // onChanged: _setEmail,
                                // onFieldSubmitted: (text) => this.widget.onFieldSubmitted(),
                              ),
                            ),
                            Container(
                              width: 300,
                              height: 48,
                              margin: EdgeInsets.symmetric(vertical: 6),
                              child: FormButton(
                                text: 'Entrar',
                                onPressed: () =>
                                    _formKey.currentState.validate(),
                              ),
                            ),
                          ],
                        )),
                    FlatButton(
                      textColor: Colors.white,
                      child: Text(
                        'Já tenho uma conta!',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('SignIn'),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

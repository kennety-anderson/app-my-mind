import 'package:flutter/material.dart';
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [const Color(0xFF003891), const Color(0xFF0063FF)],
            ),
          ),
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
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 5),
                                  hintText: 'Nome',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  prefixIcon: Icon(
                                    Icons.person_outline,
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
                                    borderSide:
                                        BorderSide(color: Colors.white60),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white60),
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
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 5),
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
                                    borderSide:
                                        BorderSide(color: Colors.white60),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white60),
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
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 5),
                                  hintText: 'Cpf',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  prefixIcon: Icon(
                                    Icons.assignment_ind,
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
                                    borderSide:
                                        BorderSide(color: Colors.white60),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white60),
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
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 5),
                                  hintText: 'Data de nascimento',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  prefixIcon: Icon(
                                    Icons.date_range,
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
                                    borderSide:
                                        BorderSide(color: Colors.white60),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white60),
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
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 5),
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
                                    borderSide:
                                        BorderSide(color: Colors.white60),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white60),
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
                      onPressed: () => Navigator.pushNamed(context, 'SignIn'),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

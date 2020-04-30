import 'package:flutter/material.dart';
import 'package:my_mind/customs/BoxDecoration/SimpleGradient.dart';
import 'package:my_mind/utils/classes/HiddenBehavior.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:my_mind/utils/validators/formValidators.dart';
import 'package:my_mind/widgets/Buttons/FormButton.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                                            // onChanged: _setEmail,
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
                                            // onChanged: _setEmail,
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
                                            // onChanged: _setEmail,
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
                                            // onChanged: _setEmail,
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
                                            // onChanged: _setEmail,
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
                                          _formKey.currentState.validate(),
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

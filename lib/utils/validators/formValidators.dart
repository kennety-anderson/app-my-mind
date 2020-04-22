String emailValidator(String text) {
  if (text.isEmpty) return 'Preencha este campo!';
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(text))
    return 'Email invalido!';
  else
    return null;
}

String passwordValidator(String text) => text.isEmpty
    ? 'Preencha este campo!'
    : text.length < 8 ? 'A senha deve conter no minimo 8 caracteres!' : null;

String emailValidator(String text) {
  if (text.isEmpty) return 'Preencha este campo!';
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return !regex.hasMatch(text) ? 'Email invalido!' : null;
}

String passwordValidator(String text) => text.isEmpty
    ? 'Preencha este campo!'
    : text.length < 8 ? 'A senha deve conter no minimo 8 caracteres!' : null;

String nameValidator(String text) => text.isEmpty
    ? 'Preencha este campo!'
    : text.length < 3 ? 'Nome muito curto!' : null;

String dateValidator(String text) {
  if (text.isEmpty) return 'Preencha este campo!';
  Pattern pattern =
      r'^(((0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/(19|20)\d{2}))$';

  RegExp regex = new RegExp(pattern);
  return !regex.hasMatch(text)
      ? "Formato da data invalido! Ex: 01/12/1990."
      : null;
}

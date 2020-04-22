import 'package:flutter/material.dart';
import 'package:my_mind/pages/Register/SignIn.dart';
import 'package:my_mind/pages/Register/SignUp.dart';

routes(BuildContext context) {
  return {'SignIn': (context) => SignIn(), 'SignUp': (context) => SignUp()};
}

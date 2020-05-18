import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
        BuildContext context, String message,
        {Color color}) =>
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message ?? 'Carregando',
          style: TextStyle(color: color ?? Colors.white),
        ),
      ),
    );

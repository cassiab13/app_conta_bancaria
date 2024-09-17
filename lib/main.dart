import 'package:appcontabancaria/screens/transacoes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyBank());
}

class MyBank extends StatelessWidget {
  const MyBank({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.greenAccent,
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: Transacoes(),
    );
  }
}

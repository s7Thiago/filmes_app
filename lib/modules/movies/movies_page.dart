import 'package:flutter/material.dart';

/// Responsável por chamar as outras telas
class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('I am on Movies Page'),
      ),
    );
  }
}

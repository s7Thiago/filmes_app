import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos Page'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('I am on Favorites Page'),
      ),
    );
  }
}

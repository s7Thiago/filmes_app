import 'package:filmes_app/application/ui/theme_extensions.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  const FilterTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 100, minHeight: 30),
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: context.themeRed,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(
        'infantil',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}

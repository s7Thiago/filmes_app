import 'package:filmes_app/application/ui/theme_extensions.dart';
import 'package:filmes_app/models/cast_model.dart';
import 'package:flutter/material.dart';

class MovieCast extends StatelessWidget {
  final CastModel? cast;

  const MovieCast({
    Key? key,
    this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              cast?.image ?? '',
              fit: BoxFit.cover,
              width: 85,
              height: 85,
            ),
          ),
          Text(
            cast?.name ?? '',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            cast?.character ?? '',
            style: TextStyle(
              fontSize: 12,
              color: context.themeGrey,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:filmes_app/modules/movies/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesHeader extends GetView<MoviesController> {
  const MoviesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 196,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: Get.width,
            child: Image.asset(
              'assets/images/header.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            width: Get.width * .9,
            child: TextField(
              onChanged: (value) => controller.filterByName(value),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Procurar Filmes',
                labelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                prefixIcon: const Icon(Icons.search),
                contentPadding: EdgeInsets.zero,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          )
        ],
      ),
    );
  }
}

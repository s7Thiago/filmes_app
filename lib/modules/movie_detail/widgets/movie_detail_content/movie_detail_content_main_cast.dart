import 'package:filmes_app/application/ui/theme_extensions.dart';
import 'package:filmes_app/models/movie_detail_model.dart';
import 'package:filmes_app/modules/movie_detail/widgets/movie_detail_content/movie_cast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailContentMainCast extends StatelessWidget {
  final MovieDetailModel? movie;
  final showPanel = false.obs;

  MovieDetailContentMainCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: context.themeGrey),
        Obx(() {
          return ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (int index, bool isExpanded) {
              showPanel.toggle();
            },
            children: [
              ExpansionPanel(
                // define se o header será clicável para abrir ou fechar o painel
                canTapOnHeader: false,
                isExpanded: showPanel.value,
                backgroundColor: Colors.white,
                headerBuilder: (context, isExpanded) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Elenco', style: TextStyle(fontSize: 16)),
                    ),
                  );
                },
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        movie?.cast.map((c) => MovieCast(cast: c)).toList() ??
                            [],
                  ),
                ),
              )
            ],
          );
        })
      ],
    );
  }
}

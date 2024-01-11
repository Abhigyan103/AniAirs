import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';

import '../card.dart';

class CardGrid extends StatelessWidget {
  const CardGrid({super.key, required this.animeList});
  final List<Anime> animeList;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            mainAxisExtent: 250),
        itemBuilder: (context, index) {
          return MyCard(anime: animeList[index]);
        },
        itemCount: animeList.length,
      ),
    );
  }
}

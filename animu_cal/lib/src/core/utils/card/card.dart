import 'package:animu_cal/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jikan_api/jikan_api.dart';

import 'widgets/card_air.dart';
import 'widgets/card_genre.dart';
import 'widgets/card_gradient.dart';
import 'widgets/card_image.dart';
import 'widgets/card_rating.dart';
import 'widgets/card_summary.dart';
import 'widgets/card_time.dart';
import 'widgets/card_title.dart';

class MyCard extends ConsumerWidget {
  const MyCard({super.key, required this.anime});
  final Anime anime;
  // final bool isAiring;
  // final String? title, summary, time, rating;
  // final List<String>? genres;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        SystemSound.play(SystemSoundType.click);
        //TODO: IMPLEMENT PAGE
      },
      onLongPress: () {
        HapticFeedback.mediumImpact();
        //TODO: IMPLEMENT HOLD
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 250,
        width: 170,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
              offset: const Offset(0.5, 0.5),
              blurRadius: 7,
              color: MyColors.shadowPersianGreen)
        ]),
        child: Stack(children: [
          CardImage(
            url: anime.imageUrl,
          ),
          CardGradient(isAiring: anime.airing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardRating(
                rating: anime.score,
                isAiring: anime.airing,
              ),
              CardAiring(isAiring: anime.airing),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CardTitle(title: anime.title),
                // CardSummary(summary: anime.synopsis ?? 'N/A'),
                (anime.aired != null)
                    ? CardTime(
                        time: anime.aired!,
                        isAiring: anime.airing,
                      )
                    : SizedBox(),
                const SizedBox(height: 8),
                CardGenre(genres: anime.genres.map((p0) => p0.name).toList())
              ],
            ),
          )
        ]),
      ),
    );
  }
}

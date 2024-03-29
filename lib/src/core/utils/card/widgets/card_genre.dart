import 'package:AniAirs/src/core/utils/card/widgets/card_mini_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardGenre extends ConsumerWidget {
  final List<String> genres;

  const CardGenre({super.key, required this.genres});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 17,
      width: double.infinity,
      alignment: Alignment.center,
      child: ListView.separated(
        itemBuilder: (context, index) => Text(genres[index],
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w200)),
        shrinkWrap: true,
        itemCount: genres.length,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 6,
        ),
      ),
    );
  }
}

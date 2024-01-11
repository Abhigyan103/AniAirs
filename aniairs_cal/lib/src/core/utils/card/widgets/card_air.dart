import 'package:aniairs_cal/src/core/utils/card/widgets/card_mini_box.dart';
import 'package:aniairs_cal/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardAiring extends ConsumerWidget {
  final bool isAiring;
  const CardAiring({super.key, this.isAiring = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: (!isAiring)
            ? const SizedBox()
            : CardMiniBox(
                text: 'Airing',
                backgroundColor: MyColors.black,
                textColor: MyColors.saffron,
              ));
  }
}

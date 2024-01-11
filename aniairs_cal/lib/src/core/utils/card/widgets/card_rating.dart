import 'package:aniairs_cal/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardRating extends ConsumerWidget {
  final double? rating;
  final bool isAiring;
  const CardRating({super.key, this.rating, required this.isAiring});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color backColor = MyColors.persianGreen;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: (rating == null)
          ? const SizedBox()
          : Container(
              height: 25,
              width: 50,
              decoration: BoxDecoration(
                color: isAiring ? backColor.withAlpha(190) : backColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      rating.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 10,
                          color: (isAiring) ? Colors.black : Colors.white),
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToLastDescent: false),
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                      color: MyColors.saffron,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

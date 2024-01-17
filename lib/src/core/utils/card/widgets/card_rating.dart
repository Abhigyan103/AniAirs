import 'package:AniAirs/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardRating extends ConsumerWidget {
  final double? rating;
  final bool isAiring;
  const CardRating({super.key, this.rating, required this.isAiring});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color backColor = Colors.black54;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: (rating == null)
          ? const SizedBox()
          : Container(
              height: 25,
              width: 50,
              decoration: BoxDecoration(
                color: backColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 15,
                      color: MyColors.saffron,
                    ),
                    Text(
                      rating.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 10,
                          color: Colors.white),
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToLastDescent: false),
                    ),

                  ],
                ),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardTime extends ConsumerWidget {
  final String time;
  final bool isAiring;
  const CardTime({super.key, required this.time, this.isAiring = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return (isAiring)
        ? Text(
            time,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 11, fontWeight: FontWeight.w500),
          )
        : const SizedBox();
  }
}

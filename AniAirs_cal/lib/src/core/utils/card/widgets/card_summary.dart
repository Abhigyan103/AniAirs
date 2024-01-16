import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardSummary extends ConsumerWidget {
  const CardSummary({super.key, required this.summary});
  final String summary;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      summary,
      style: Theme.of(context).textTheme.bodySmall,
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
      textHeightBehavior:
          const TextHeightBehavior(applyHeightToLastDescent: false),
    );
  }
}

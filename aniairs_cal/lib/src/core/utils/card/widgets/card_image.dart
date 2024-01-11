import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardImage extends ConsumerWidget {
  final String? url;
  final bool isAiring;
  const CardImage({super.key, this.url, this.isAiring = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double inf = double.infinity;
    return Container(
        width: inf,
        height: inf,
        foregroundDecoration: !isAiring
            ? const BoxDecoration(
                color: Colors.grey,
                backgroundBlendMode: BlendMode.saturation,
              )
            : null,
        child: CachedNetworkImage(
          imageUrl: url!,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          // cacheHeight: ,
          // cacheWidth: inf,
        ));
  }
}

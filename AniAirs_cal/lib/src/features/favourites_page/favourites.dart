import 'package:AniAirs_cal/src/core/utils/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/navigation_drawer/my_navigation_drawer.dart';

class Favourites extends ConsumerWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      drawer: MyNavigationDrawer(),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          MyAppBar(),
          // CardGrid(),
        ],
      ),
    );
  }
}

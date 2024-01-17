import 'package:AniAirs/src/core/utils/app_bar.dart';
import 'package:AniAirs/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jikan_api/jikan_api.dart';

import 'controllers/top_rated_controller.dart';
import '../../core/utils/card/widgets/card_grid.dart';
import '../../core/utils/navigation_drawer/my_navigation_drawer.dart';

class TopRated extends ConsumerWidget {
  const TopRated({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var animeListFuture = ref.watch(myTopAnimeFutureProvider);
    List<Anime> animeList = ref.watch(myTopAnimeProvider);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(
            refreshTriggerPullDistance: 150,
            onRefresh: () async {
              // return ref.read(myTopAnimeProvider.notifier).setTopAnime();
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Rated',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              ref.read(showOptionsProvider.notifier).toggle();
                            },
                            child: const Text('Filters'))
                      ]),
                  ref.watch(showOptionsProvider)
                      ? Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              children: [
                                DropdownMenu(
                                    label: const Text('Filter'),
                                    width:
                                        MediaQuery.sizeOf(context).width - 32,
                                    onSelected: (value) {
                                      ref
                                          .read(myTopAnimeProvider.notifier)
                                          .setTopFilter(value);
                                    },
                                    dropdownMenuEntries: [
                                      ...TopFilter.values.map((e) {
                                        String item =
                                            e.toString().split('.')[1];
                                        item = item[0].toUpperCase() +
                                            item.substring(1);
                                        return DropdownMenuEntry(
                                            value: e, label: item);
                                      }),
                                      const DropdownMenuEntry(
                                          value: null, label: 'None')
                                    ]),
                                const SizedBox(
                                  height: 16,
                                ),
                                DropdownMenu(
                                    label: const Text('Type'),
                                    width:
                                        MediaQuery.sizeOf(context).width - 32,
                                    onSelected: (value) {
                                      ref
                                          .read(myTopAnimeProvider.notifier)
                                          .setTopType(value);
                                    },
                                    dropdownMenuEntries: [
                                      ...AnimeType.values.map((e) {
                                        String item =
                                            e.toString().split('.')[1];
                                        item = item[0].toUpperCase() +
                                            item.substring(1);
                                        return DropdownMenuEntry(
                                            value: e, label: item);
                                      }),
                                      const DropdownMenuEntry(
                                          value: null, label: 'None')
                                    ]),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    child: FilledButton(
                                        onPressed: () {
                                          ref
                                              .read(myTopAnimeProvider.notifier)
                                              .setTopAnime();
                                        },
                                        child: Text(
                                          'Search',
                                          style:
                                              TextStyle(color: MyColors.black),
                                        ))),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
          animeListFuture.when(
            data: (data) {
              return CardGrid(
                animeList: animeList,
              );
            },
            error: (error, stackTrace) {
              print('Error : $error');
              return const SliverToBoxAdapter();
              // return SizedBox();
            },
            loading: () {
              print('LOADING');
              return const SliverToBoxAdapter();
              // return SizedBox();
            },
          )
        ],
      ),
    );
  }
}

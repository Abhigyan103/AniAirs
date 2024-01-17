import 'package:AniAirs/src/core/utils/app_bar.dart';
import 'package:AniAirs/src/core/utils/card/widgets/card_grid.dart';
import 'package:AniAirs/src/core/utils/navigation_drawer/my_navigation_drawer.dart';
import 'package:AniAirs/src/views/seasonal_calendar/controller/seasonal_calendar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:AniAirs/theme.dart';

class SeasonalCalendar extends ConsumerWidget {
  const SeasonalCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var animeListFuture = ref.watch(mySeasonalAnimeFutureProvider);
    List<Anime> animeList = ref.watch(mySeasonalAnimeProvider);

    List<int> years = List.generate(
        DateTime.now().year - 1899, (index) => DateTime.now().year - index);

    return Scaffold(
      drawer: const MyNavigationDrawer(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(
            refreshTriggerPullDistance: 150,
            onRefresh: () async {},
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seasonal Anime',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ref.read(showOptionsProvider.notifier).toggle();
                        },
                        child: const Text('Season'))
                  ],
                ),
                ref.watch(showOptionsProvider)
                    ? Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(children: [
                            DropdownMenu(
                              label: const Text("Season"),
                              width: MediaQuery.sizeOf(context).width - 32,
                              onSelected: (value) {
                                ref
                                    .read(mySeasonalAnimeProvider.notifier)
                                    .setSeason(value);
                              },
                              dropdownMenuEntries: [
                                ...SeasonType.values.map((e) {
                                  String item =
                                      e.toString().toUpperCase().split('.')[1];
                                  return DropdownMenuEntry(
                                      value: e, label: item);
                                }),
                                const DropdownMenuEntry(
                                    value: null, label: 'None')
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            DropdownMenu(
                              label: const Text('Year'),
                              width: MediaQuery.sizeOf(context).width - 32,
                              onSelected: (value) {
                                ref
                                    .read(mySeasonalAnimeProvider.notifier)
                                    .setYear(value as int?);
                              },
                              dropdownMenuEntries:
                                  List<DropdownMenuEntry<Object>>.generate(
                                years.length,
                                (index) => DropdownMenuEntry(
                                  value: years[index],
                                  label: '${years[index]}',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                                width: double.infinity,
                                child: FilledButton(
                                    onPressed: () {
                                      ref
                                          .read(
                                              mySeasonalAnimeProvider.notifier)
                                          .setSeasonalAnime();
                                    },
                                    child: Text(
                                      'Search',
                                      style: TextStyle(color: MyColors.black),
                                    ))),
                          ]),
                        ),
                      )
                    : const SizedBox()
              ]),
            ),
          ),
          animeListFuture.when(data: (data) {
            return CardGrid(animeList: animeList);
          }, error: (error, stackTrace) {
            print("Error in SEASONAL SECTION: $error");
            return const SliverToBoxAdapter();
          }, loading: () {
            print("LOADING");
            return const SliverToBoxAdapter();
          })
        ],
      ),
    );
  }
}

import 'package:jikan_api/jikan_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/my_jikan.dart';
part 'seasonal_calendar_controller.g.dart';

@riverpod
class ShowOptions extends _$ShowOptions {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

@riverpod
Future<void> mySeasonalAnimeFuture(MySeasonalAnimeFutureRef ref) async {
  return ref.watch(mySeasonalAnimeProvider.notifier).setSeasonalAnime();
}

@riverpod
class MySeasonalAnime extends _$MySeasonalAnime {
  SeasonType? _season;
  int? _year;

  @override
  List<Anime> build() {
    return [];
  }

  SeasonType? getSeason() {
    return _season;
  }

  setSeason(SeasonType? season) {
    _season = season;
  }

  int? getYear() {
    return _year;
  }

  setYear(int? year) {
    _year = year;
  }

  Future<List<Anime>> getSeasonalAnime() async {
    final jikan = MyJikan.getInstance();
    final season = _season;
    final year = _year;
    List<Anime> list = await jikan
        .getSeason(season: season, year: year)
        .then((value) => value.toList());
    return list;
  }

  Future<void> setSeasonalAnime() async {
    state = await getSeasonalAnime();
  }
}

import 'package:jikan_api/jikan_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/my_jikan.dart';

part 'top_rated_controller.g.dart';

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
Future<void> myTopAnimeFuture(MyTopAnimeFutureRef ref) async {
  return ref.watch(myTopAnimeProvider.notifier).setTopAnime();
}

@riverpod
class MyTopAnime extends _$MyTopAnime {
  TopFilter? _filter;
  AnimeType? _type;
  @override
  List<Anime> build() {
    return [];
  }

  TopFilter? getTopFilter() {
    return _filter;
  }

  setTopFilter(TopFilter? filter) {
    _filter = filter;
  }

  AnimeType? getTopType() {
    return _type;
  }

  setTopType(AnimeType? type) {
    _type = type;
  }

  Future<List<Anime>> getTopAnime() async {
    final jikan = MyJikan.getInstance();
    final filter = _filter;
    final type = _type;
    List<Anime> list = await jikan
        .getTopAnime(filter: filter, type: type)
        .then((value) => value.toList());
    return list;
  }

  Future<void> setTopAnime() async {
    state = await getTopAnime();
  }
}

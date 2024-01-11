import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_drawer_provider.g.dart';

@riverpod
class NavigationDrawerIndex extends _$NavigationDrawerIndex {
  @override
  int build() => 0;

  void setIndex(int i) {
    state = i;
  }
}

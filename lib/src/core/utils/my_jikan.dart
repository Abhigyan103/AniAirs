import 'package:jikan_api/jikan_api.dart';

class MyJikan {
  static Jikan? _instance;
  static Jikan getInstance() {
    _instance ??= Jikan();
    return _instance!;
  }
}

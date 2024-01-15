import 'package:animu_cal/src/views/not_implemented/not_implemented.dart';
import 'package:animu_cal/src/views/seasonal_calendar/seasonal_calendar.dart';
import 'package:animu_cal/src/views/top_rated.dart/top_rated.dart';
import 'package:animu_cal/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/navigation_drawer_provider.dart';
import '../../core/utils/navigation_drawer/my_navigation_drawer.dart';

class MainPage extends ConsumerWidget {
  MainPage({super.key});

  final screensList = [
    TopRated(),
    SeasonalCalendar(),
    NotImplemented(),
    NotImplemented(),
    NotImplemented(),
    NotImplemented(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(navigationDrawerIndexProvider);
    return Scaffold(
      drawer: const MyNavigationDrawer(),
      appBar: AppBar(
        title: Text('AniAirs'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        elevation: 100,
      ),
      body: screensList[index],
    );
  }
}

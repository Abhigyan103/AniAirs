import 'package:aniairs_cal/src/core/providers/navigation_drawer_provider.dart';
import 'package:aniairs_cal/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'custom_navigation_drawer.dart';
import 'widgets/account_image.dart';

class MyNavigationDrawer extends ConsumerWidget {
  const MyNavigationDrawer({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(navigationDrawerIndexProvider);
    return CustomNavigationDrawer(
        selectedIndex: index,
        onDestinationSelected: (int i) =>
            ref.read(navigationDrawerIndexProvider.notifier).setIndex(i),
        indicatorColor: navColors[index % navColors.length],
        backgroundStack: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment(1, 1),
                  radius: 1.95,
                  colors: [Color.fromARGB(255, 26, 66, 62), Color(0xFF1E1E1E)]),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -40,
            child: Container(
                width: 300,
                height: 300,
                decoration: const ShapeDecoration(
                    gradient: RadialGradient(
                      radius: 0.5,
                      colors: [
                        Color(0x1C9747FF),
                        Color(0x169747FF),
                        Color(0x009747FF)
                      ],
                    ),
                    shape: OvalBorder())),
          ),
        ],
        children: [
          const AccountImage(
            name: 'Abhigyan Singh',
            email: "Abhigyansingh56@gmail.com",
          ),
          const SizedBox(
            height: 25,
          ),
          CustomNavigationDrawerDestination(
              icon: Icon(
                CupertinoIcons.calendar,
                color: MyColors.sandyBrown,
              ),
              label: const Text(
                'Seasonal Calendar',
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToLastDescent: false),
              )),
          const CustomNavigationDrawerDestination(
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: Colors.redAccent,
              ),
              label: Text('Favourites')),
          CustomNavigationDrawerDestination(
              icon: Icon(
                CupertinoIcons.star_fill,
                color: MyColors.saffron,
              ),
              label: const Text('Top Rated')),
          CustomNavigationDrawerDestination(
              icon: Icon(
                CupertinoIcons.calendar_today,
                color: MyColors.persianGreen,
              ),
              label: const Text('Airing Today')),
          Divider(
            height: 50,
            color: MyColors.persianGreen,
            thickness: 0.5,
            indent: 12,
            endIndent: 12,
          ),
          const CustomNavigationDrawerDestination(
              icon: Icon(
                CupertinoIcons.settings_solid,
                color: Colors.grey,
              ),
              label: Text('Settings')),
          const CustomNavigationDrawerDestination(
              icon: Icon(
                CupertinoIcons.person_3_fill,
                color: Colors.grey,
              ),
              label: Text('About')),
        ]);
  }
}

import 'package:AniAirs/src/views/top_rated.dart/top_rated.dart';
import 'package:AniAirs/theme.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/get_started.jpg'),
                  fit: BoxFit.fitHeight))),
      Padding(
        padding: const EdgeInsets.all(32),
        child: Align(
            alignment: Alignment.bottomRight,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: MyColors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => TopRated()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: MyColors.persianGreen,
                  )
                ],
              ),
            )),
      )
    ]));
  }
}

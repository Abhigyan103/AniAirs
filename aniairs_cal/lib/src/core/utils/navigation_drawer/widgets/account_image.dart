import 'package:flutter/material.dart';

import '../../blur.dart';

class AccountImage extends StatelessWidget {
  const AccountImage({
    super.key,
    required this.name,
    this.imageURL,
    this.email,
  });
  final String name;
  final String? email, imageURL;

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 9 / 20;
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).width * aspectRatio;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: (imageURL != null)
              ? NetworkImage(imageURL!)
              : const AssetImage("assets/1330710.png") as ImageProvider<Object>,
          fit: BoxFit.cover,
        ),
      ),
      child: MyBlur(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (name).toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        // color: MyColors.lightPersianGreen,
                      ),
                ),
                (email != null)
                    ? Text(
                        email!.toLowerCase(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      )
                    : const SizedBox(),
              ]),
        ),
      ),
    );
  }
}

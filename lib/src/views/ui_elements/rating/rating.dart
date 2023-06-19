import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class Rating extends StatefulWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double _getWidth() {
    if (MediaQuery.of(context).size.width <= 550) {
      return MediaQuery.of(context).size.width / 2 - 40;
    } else if (MediaQuery.of(context).size.width <= 750) {
      return (MediaQuery.of(context).size.width / 2) - 50;
    } else if (Responsive.isWeb(context)) {
      return ((MediaQuery.of(context).size.width - 240) / 4) - 36;
    } else {
      return (MediaQuery.of(context).size.width / 3) - 36;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 0,
        runSpacing: 26,
        children: [
          _ratingBar(
            title: 'Default rating',
            icon: [
              CupertinoIcons.star,
              CupertinoIcons.star_fill,
              CupertinoIcons.star_lefthalf_fill
            ],
          ),
          FxBox.w16,
          _ratingBar(
            title: 'Half rating',
            allowHalfRating: true,
            icon: [
              CupertinoIcons.star,
              CupertinoIcons.star_fill,
              CupertinoIcons.star_lefthalf_fill
            ],
          ),
          FxBox.w16,
          _ratingBar(
            title: 'Disable rating',
            enable: false,
            icon: [
              CupertinoIcons.star,
              CupertinoIcons.star_fill,
              CupertinoIcons.star_lefthalf_fill
            ],
          ),
          FxBox.w16,
          _ratingBar(
            title: 'Custom icon rating',
            icon: [
              CupertinoIcons.heart,
              CupertinoIcons.heart_fill,
              CupertinoIcons.star_lefthalf_fill
            ],
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _ratingBar({
    required String title,
    bool? allowHalfRating,
    bool? enable,
    required List<IconData> icon,
    Color? color,
    int? length,
  }) {
    return SizedBox(
      height: 180,
      width: _getWidth(),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w700),
              ),
              FxBox.h16,
              FxRatingBar(
                length: length ?? 5,
                onRated: (rating) {},
                allowHalfRating: allowHalfRating ?? false,
                defaultIcon: icon[0],
                filledIcon: icon[1],
                halfFilledIcon: icon[2],
                enable: enable ?? true,
                color: color,
                borderColor: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

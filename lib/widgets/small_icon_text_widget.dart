import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:TinyDragonTherapy/themes/colors.dart';

class SmallIconTextWidget extends StatelessWidget {
  final String image;
  final String text;

  const SmallIconTextWidget({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: SvgPicture.asset(image),
        ),
        Expanded(
          flex: 5,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: kSecondarySwatchColor.shade900,
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

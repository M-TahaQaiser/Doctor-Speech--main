import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:TinyDragonTherapy/constants/component.dart';
import 'package:TinyDragonTherapy/themes/colors.dart';

class HowAreYouFeelingWidget extends StatelessWidget {
  final String iconPath;
  final Color color;
  final String label;
  final void Function()? onTap;

  const HowAreYouFeelingWidget({
    super.key,
    required this.iconPath,
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: size(context).width * 0.2,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kDarkColor,
                  ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final String body;
  final String action;
  final String icon;
  final String image;
  final Color textColor;
  final Color backgroundColor;
  final Color secondaryColor;

  const TaskWidget({
    super.key,
    required this.title,
    required this.body,
    required this.action,
    required this.icon,
    required this.image,
    required this.textColor,
    required this.backgroundColor,
    required this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.w900,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Text(
                  body,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: textColor,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text(
                          action,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: secondaryColor,
                              ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          icon,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              image,
            ),
          ),
        ],
      ),
    );
  }
}

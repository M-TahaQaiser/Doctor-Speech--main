import 'package:flutter/material.dart';
import 'package:TinyDragonTherapy/constants/component.dart';
import 'package:TinyDragonTherapy/themes/colors.dart';
import 'package:TinyDragonTherapy/widgets/custom_divider.dart';

class RowWithTitleAndTrailingWIdget extends StatelessWidget {
  const RowWithTitleAndTrailingWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Lorem Ipsum 1',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: kDarkColor,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            SizedBox(
              width: size(context).width * 0.3,
              child: Text(
                'Dummy',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: kDarkColor,
                      fontWeight: FontWeight.bold,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        SizedBox(height: size(context).height * 0.02),
        const CustomDivider(
          color: Colors.grey,
        ),
      ],
    );
  }
}

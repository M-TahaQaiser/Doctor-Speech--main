import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:TinyDragonTherapy/themes/colors.dart';

class QuoteWidget extends StatelessWidget {
  final String text;

  const QuoteWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF4F3F1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 10,
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: kDarkColor,
                    ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SvgPicture.asset('assets/images/quote-icon.svg'),
            ),
          ],
        ),
      ),
    );
  }
}

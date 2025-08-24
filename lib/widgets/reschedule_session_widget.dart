import 'package:flutter/material.dart';
import 'package:TinyDragonTherapy/constants/component.dart';
import 'package:TinyDragonTherapy/themes/colors.dart';
import 'package:TinyDragonTherapy/widgets/custom_divider.dart';
import 'package:TinyDragonTherapy/widgets/small_icon_text_widget.dart';

class RescheduleSessionWidget extends StatelessWidget {
  final String image;
  final String title;
  final String body;
  final String date;
  final String time;
  final void Function() rescheduleOnTap;
  final void Function() joinOnTap;

  const RescheduleSessionWidget({
    super.key,
    required this.image,
    required this.title,
    required this.body,
    required this.date,
    required this.time,
    required this.rescheduleOnTap,
    required this.joinOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size(context).width,
      decoration: BoxDecoration(
        color: kSecondarySwatchColor.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.asset(
              image,
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kSecondarySwatchColor.shade900,
                    fontWeight: FontWeight.bold,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            subtitle: Text(
              body,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kSecondarySwatchColor.shade900,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const CustomDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: SmallIconTextWidget(
                    image: 'assets/images/calendar-grey-icon.svg',
                    text: date,
                  ),
                ),
                Expanded(
                  child: SmallIconTextWidget(
                    image: 'assets/images/clock-grey-icon.svg',
                    text: time,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: SizedBox(
                  width: size(context).width * 0.4,
                  child: FilledButton(
                    onPressed: rescheduleOnTap,
                    style: Theme.of(context).filledButtonTheme.style,
                    child: Text(
                      'Reschedule',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: joinOnTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: SizedBox(
                    child: Text(
                      'Join Now',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kSecondarySwatchColor,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

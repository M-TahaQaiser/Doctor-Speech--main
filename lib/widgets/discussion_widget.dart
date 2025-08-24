import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:TinyDragonTherapy/constants/component.dart';
import 'package:TinyDragonTherapy/themes/colors.dart';

class DiscussionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String time;

  const DiscussionWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 8.0,
      contentPadding: EdgeInsets.zero,
      titleAlignment: ListTileTitleAlignment.top,
      leading: SvgPicture.asset(image, height: 50),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: kDarkColor,
                  fontWeight: FontWeight.bold,
                ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(width: size(context).width * 0.02),
          CircleAvatar(
            backgroundColor: kTextColor,
            radius: 2,
          ),
          SizedBox(width: size(context).width * 0.02),
          Text(
            time,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: kTextColor,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: kDarkColor,
                ),
          ),
          SizedBox(height: size(context).height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LikeWidget(image: 'assets/images/like-icon-filled.svg', count: '12'),
                  Container(width: size(context).width * 0.1),
                  const CommentWidget(count: '0'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: InkWell(
                  child: SvgPicture.asset('assets/images/share-icon.svg'),
                  onTap: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: size(context).height * 0.01),
        ],
      ),
    );
  }
}

class LikeWidget extends StatefulWidget {
  final String image;
  final String count;

  const LikeWidget({
    Key? key,
    required this.image,
    required this.count,
  }) : super(key: key);

  @override
  State<LikeWidget> createState() => _EngagementMetricsWidgetState();
}

class _EngagementMetricsWidgetState extends State<LikeWidget> {
  bool isliked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: SvgPicture.asset(isliked ? 'assets/images/like-icon-filled.svg' : 'assets/images/like-icon.svg'),
          onTap: () {
            setState(() {
              isliked = !isliked;
            });
          },
        ),
        const SizedBox(width: 8.0),
        Text(
          widget.count == '0' ? '' : widget.count,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: kDarkColor,
              ),
        ),
      ],
    );
  }
}

class CommentWidget extends StatelessWidget {
  final String count;

  const CommentWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: SvgPicture.asset('assets/images/comment-icon.svg'),
          onTap: () {},
        ),
        const SizedBox(width: 8.0),
        Text(
          count == '0' ? '' : count,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: kDarkColor,
              ),
        ),
      ],
    );
  }
}

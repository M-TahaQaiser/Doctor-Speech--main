import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:TinyDragonTherapy/constants/component.dart';
import 'package:TinyDragonTherapy/screens/detail_screen.dart';
import 'package:TinyDragonTherapy/themes/colors.dart';
import 'package:TinyDragonTherapy/widgets/custom_divider.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> menuItems = [
      {
        'icon': 'assets/images/shining-icon.svg',
        'title': 'Home',
        'onTap': () {
          Scaffold.of(context).closeEndDrawer();
        }
      },
      {
        'icon': 'assets/images/info-icon.svg',
        'title': 'About Us',
        'onTap': () {
          // Navigator.of(context).pushNamed(AboutUsScreen.routeName);
          Get.to(() => const DetailScreen(
                title: 'About Us',
              ));
        }
      },
      {
        'icon': 'assets/images/book-info-icon.svg',
        'title': 'How to Use',
        'onTap': () {
          Get.to(() => const DetailScreen(
                title: 'How to Use',
              ));
        }
      },
      {
        'icon': 'assets/images/hand-star-icon.svg',
        'title': 'We value your Opinion',
        'onTap': () {
          Get.to(() => const DetailScreen(
                title: 'We value your Opinion',
              ));
        }
      },
      {
        'icon': 'assets/images/email-icon.svg',
        'title': 'Email Us',
        'onTap': () {
          Get.to(() => const DetailScreen(
                title: 'Email Us',
              ));
        }
      },
      {
        'icon': 'assets/images/website-icon.svg',
        'title': 'Visit our website',
        'onTap': () {
          Get.to(() => const DetailScreen(
                title: 'Visit our website',
              ));
        }
      },
    ];

    List<Map<String, dynamic>> additionalMenuItems = [
      {
        'icon': 'assets/images/privacy-policy-icon.svg',
        'title': 'Privacy policy',
        'onTap': () {
          Get.to(() => const DetailScreen(
                title: 'Privacy policy',
              ));
        }
      },
      {
        'icon': 'assets/images/folder-icon.svg',
        'title': 'Terms of use',
        'onTap': () {
          Get.to(() => const DetailScreen(
                title: 'Terms of use',
              ));
        }
      },
      {
        'icon': 'assets/images/settings-icon.svg',
        'title': 'Manage Subscriptions',
        'onTap': () {}
      },
    ];

    return SizedBox(
      width: double.infinity,
      child: Drawer(
        backgroundColor: kDarkColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: size(context).height * 0.2,
              child: Align(
                alignment: Alignment.center,
                child: ListTile(
                  minVerticalPadding: 16,
                  titleAlignment: ListTileTitleAlignment.center,
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/tiny-dragon-cartoon.png'),
                    radius: 30.0,
                  ),
                  title: Text(
                    'Tiny',
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    'Dragon',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  trailing: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/images/cross-icon.svg'),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ),
            const CustomDivider(),
            for (var item in menuItems)
              ListTile(
                leading: SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(item['icon'], height: 24),
                ),
                title: Text(
                  item['title'],
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                onTap: item['onTap'],
              ),
            const CustomDivider(),
            for (var item in additionalMenuItems)
              ListTile(
                leading: SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(item['icon'], height: 24),
                ),
                title: Text(
                  item['title'],
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                onTap: item['onTap'],
              ),
          ],
        ),
      ),
    );
  }
}

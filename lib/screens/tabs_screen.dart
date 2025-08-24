import 'dart:io';

import 'package:TinyDragonTherapy/controller/navigator_controller.dart';
import 'package:TinyDragonTherapy/screens/discussions_screen.dart';
import 'package:TinyDragonTherapy/screens/ebooks_screen.dart';
import 'package:TinyDragonTherapy/screens/home_screen.dart';
import 'package:TinyDragonTherapy/screens/sessions_screen.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  // static const routeName = '/tabs';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final navController = Get.put(NavigatorController());
  // int navController.currentIndex = 0;

  // void _selectPage(int index) {
  //   setState(() {
  //     navController.currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final List<Map<String, dynamic>> pages = [
      {
        'page': HomeScreen(),
        'title': 'Home',
        'icon': SvgPicture.asset('assets/images/home-icon.svg', height: 24),
        'filled-icon':
            SvgPicture.asset('assets/images/home-icon-filled.svg', height: 24),
      },
      {
        'page': const SessionsScreen(),
        'title': 'Sessions',
        'icon': SvgPicture.asset('assets/images/session-icon.svg', height: 24),
        'filled-icon': SvgPicture.asset('assets/images/session-icon-filled.svg',
            height: 24),
      },
      {
        'page': const EBooksScreen(),
        'title': 'E Books',
        'icon': SvgPicture.asset('assets/images/book-icon.svg', height: 24),
        'filled-icon':
            SvgPicture.asset('assets/images/book-icon-filled.svg', height: 24),
      },
      {
        'page': const DiscussionsScreen(),
        'title': 'Discussions',
        'icon':
            SvgPicture.asset('assets/images/discussion-icon.svg', height: 24),
        'filled-icon': SvgPicture.asset(
            'assets/images/discussion-icon-filled.svg',
            height: 24),
      },
    ];
    Future<bool> showExitConfirmationDialog(BuildContext context) async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                "Exit Confirmation",
                style: CustomTextStyle.headingStyle.copyWith(fontSize: 20.h),
              ),
              content: Text(
                "Do you really want to Exit?",
                style: CustomTextStyle.basicStyle,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    "No",
                    style: CustomTextStyle.basicStyle
                        .copyWith(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    "Yes",
                    style: CustomTextStyle.basicStyle
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ) ??
          false; // If the dialog is dismissed by tapping outside, return false
    }

    return Scaffold(
      key: scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      endDrawer:
          navController.currentIndex == 0 ? const CustomEndDrawer() : null,
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          // Show a confirmation dialog
          bool shouldLeave = await showExitConfirmationDialog(context);
          if (shouldLeave) {
            exit(0);
          }
        },
        child: GetBuilder(
          init: navController,
          builder: (controller) {
            return pages[navController.currentIndex]['page'];
          },
        ),
      ),
      bottomNavigationBar: GetBuilder(
          init: navController,
          builder: (controller) {
            return Stack(
              children: [
                BottomNavigationBar(
                  backgroundColor: kLightColor,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: [
                    ...pages.asMap().entries.map((entry) {
                      Map<String, dynamic> page = entry.value;
                      return BottomNavigationBarItem(
                        icon: page['icon'],
                        label: '',
                        activeIcon: page['filled-icon'],
                      );
                    }).toList(),
                  ],
                  currentIndex: controller.currentIndex,
                  onTap: controller.updateIndex,
                ),
                Positioned(
                  top: -12,
                  left: (MediaQuery.of(context).size.width / pages.length) *
                          controller.currentIndex +
                      (MediaQuery.of(context).size.width / pages.length) / 2 -
                      10,
                  child: Container(
                    width: 16,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: kSecondarySwatchColor),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

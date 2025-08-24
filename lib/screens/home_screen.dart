import 'package:TinyDragonTherapy/controller/navigator_controller.dart';
import 'package:TinyDragonTherapy/screens/library_screen.dart';
import 'package:TinyDragonTherapy/screens/therapy_detail_screen.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';
import 'package:TinyDragonTherapy/widgets/how_are_you_feeling_widget.dart';
import 'package:TinyDragonTherapy/widgets/large_icon_text_widget.dart';
import 'package:TinyDragonTherapy/widgets/quote_widget.dart';
import 'package:TinyDragonTherapy/widgets/task_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const routeName = '/home-screen';
  final navController = Get.put(NavigatorController());
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    List<Map<String, dynamic>> emotions = [
      {
        'iconPath': 'assets/images/happy-icon.svg',
        'color': const Color(0xffEF5DA8),
        'label': 'Happy',
        'onTap': () {},
      },
      {
        'iconPath': 'assets/images/calm-icon.svg',
        'color': const Color(0xffAEAFF7),
        'label': 'Calm',
        'onTap': () {},
      },
      {
        'iconPath': 'assets/images/manic-icon.svg',
        'color': const Color(0xffA0E3E2),
        'label': 'Manic',
        'onTap': () {},
      },
      {
        'iconPath': 'assets/images/angry-icon.svg',
        'color': const Color(0xffF09E54),
        'label': 'Angry',
        'onTap': () {},
      },
    ];

    return Scaffold(
      key: scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: const CustomEndDrawer(),
      appBar: AppBar(
        leadingWidth: size(context).width,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: kDarkColor,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                'Good Morning!',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: kDarkColor,
                      fontWeight: FontWeight.bold,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomDrawerIcon(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomDivider(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'How are you feeling today?',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: kDarkColor,
                        fontWeight: FontWeight.bold,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...emotions.map((emotion) {
                      return HowAreYouFeelingWidget(
                        iconPath: emotion['iconPath'],
                        color: emotion['color'],
                        label: emotion['label'],
                        onTap: emotion['onTap'],
                      );
                    }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const TherapyDetailScreen());
                  },
                  child: TaskWidget(
                    title: 'Therapy Plans',
                    body: 'Get back chat access and session credits',
                    action: 'View Details',
                    icon: 'assets/images/forward-icon.svg',
                    image: 'assets/images/flower-icon.svg',
                    textColor: kLightColor,
                    backgroundColor: kPrimarySwatchColor,
                    secondaryColor: kLightColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    navController.updateIndex(1);
                  },
                  child: TaskWidget(
                    title: '1 on 1 Sessions',
                    body: 'Let’s open up to the things that matter the most',
                    action: 'Book Now',
                    icon: 'assets/images/calendar-icon.svg',
                    image: 'assets/images/meeting-icon.svg',
                    textColor: kSecondarySwatchColor.shade900,
                    backgroundColor: kSecondarySwatchColor.shade50,
                    secondaryColor: kSecondarySwatchColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: LargeIconTextWidget(
                        image: 'assets/images/journal-icon.svg',
                        text: 'Journal',
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => LibraryScreen());
                        },
                        child: const LargeIconTextWidget(
                          image: 'assets/images/library-icon.svg',
                          text: 'Library',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: QuoteWidget(
                  text:
                      '"It is better to conquer yourself than to win a thousand battles."',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

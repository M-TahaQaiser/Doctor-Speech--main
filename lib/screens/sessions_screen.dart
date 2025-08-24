import 'package:TinyDragonTherapy/controller/navigator_controller.dart';
import 'package:TinyDragonTherapy/screens/book_appointment_screen.dart';
import 'package:TinyDragonTherapy/screens/view_profile_screen.dart';
import 'package:TinyDragonTherapy/widgets/rebook_session_widget.dart';
import 'package:TinyDragonTherapy/widgets/reschedule_session_widget.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});
  static const routeName = '/sessions-screen';

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  bool isExpanded = true;
  final navController = Get.put(NavigatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            navController.resetIndex();
          },
          child: const Icon(
            Icons.keyboard_backspace_outlined,
            color: Colors.grey,
          ),
        ),
        // leadingWidth: size(context).width,
        centerTitle: true,
        title: Text(
          'Sessions',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: kDarkColor,
                fontWeight: FontWeight.bold,
              ),
          // overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDivider(),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: UpcomingSessionWidget(
                  title: 'Upcoming Session',
                  body: 'Sahana V, Msc in Clinical Psychology',
                  action: 'Join Now',
                  time: '7:30 PM - 8:30 PM',
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: kTransparentColor,
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: kTransparentColor,
                ),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      isExpanded = value;
                    });
                  },
                  backgroundColor: kTransparentColor,
                  initiallyExpanded: isExpanded,
                  title: Row(
                    children: [
                      Text(
                        'All Sessions',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: kSecondarySwatchColor.shade900,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(isExpanded
                            ? 'assets/images/chevron-up-icon.svg'
                            : 'assets/images/chevron-down-icon.svg'),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child:
                        SvgPicture.asset('assets/images/scroll-caret-icon.svg'),
                  ),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RescheduleSessionWidget(
                            image: 'assets/images/person-1.png',
                            title: 'Sahana V',
                            body: 'Msc in Clinical Psychology',
                            date: '31st March ‘22',
                            time: '7:30 PM - 8:30 PM',
                            rescheduleOnTap: () {},
                            joinOnTap: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RebookSessionWidget(
                            image: 'assets/images/person-1.png',
                            title: 'Sahana V',
                            body: 'Msc in Clinical Psychology',
                            date: '31st March ‘22',
                            time: '7:30 PM - 8:30 PM',
                            rebookOnTap: () {
                              Get.to(() => const BookAppointmentScreen());
                            },
                            joinOnTap: () {
                              Get.to(() => const ViewProfileScreen());
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpcomingSessionWidget extends StatelessWidget {
  final String title;
  final String body;
  final String action;
  final String time;

  const UpcomingSessionWidget({
    super.key,
    required this.title,
    required this.body,
    required this.action,
    required this.time,
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
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: kSecondarySwatchColor.shade900,
                    fontWeight: FontWeight.w900,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              body,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kSecondarySwatchColor.shade900,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              time,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kSecondarySwatchColor.shade900,
                    fontWeight: FontWeight.bold,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  action,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: kSecondarySwatchColor,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(width: 16),
                SvgPicture.asset(
                  'assets/images/play-icon.svg',
                  height: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

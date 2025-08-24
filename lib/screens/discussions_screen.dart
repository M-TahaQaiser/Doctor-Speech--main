import 'package:TinyDragonTherapy/controller/navigator_controller.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';
import 'package:TinyDragonTherapy/widgets/discussion_widget.dart';

class DiscussionsScreen extends StatelessWidget {
  const DiscussionsScreen({super.key});
  static const routeName = '/discussions-screen';

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigatorController());
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
        centerTitle: true,
        title: Text(
          'Discussion',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: kDarkColor,
                fontWeight: FontWeight.bold,
              ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDivider(),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    DiscussionWidget(
                      title: 'Coal Dingo',
                      subtitle:
                          'Is there a therapy which can cure crossdressing & bdsm compulsion?',
                      image: 'assets/images/person-1.svg',
                      time: 'just now',
                    ),
                    CustomDivider(),
                    DiscussionWidget(
                      title: 'Pigeon Car',
                      subtitle:
                          'Is there a therapy which can cure crossdressing & bdsm compulsion?',
                      image: 'assets/images/person-2.svg',
                      time: '3 hrs ago',
                    ),
                    CustomDivider(),
                    DiscussionWidget(
                      title: 'Pigeon Car',
                      subtitle:
                          'Is there a therapy which can cure crossdressing & bdsm compulsion?',
                      image: 'assets/images/person-1.svg',
                      time: '1 hr ago',
                    ),
                    CustomDivider(),
                    DiscussionWidget(
                      title: 'Pigeon Car',
                      subtitle:
                          'Is there a therapy which can cure crossdressing & bdsm compulsion?',
                      image: 'assets/images/person-3.svg',
                      time: '2 min ago',
                    ),
                    CustomDivider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kSecondarySwatchColor,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: SvgPicture.asset('assets/images/pencil-icon.svg'),
      ),
    );
  }
}

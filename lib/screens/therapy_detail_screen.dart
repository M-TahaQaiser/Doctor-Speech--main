import 'package:TinyDragonTherapy/screens/consonants_screen.dart';
import 'package:TinyDragonTherapy/screens/vowels_screen.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';
import 'package:TinyDragonTherapy/widgets/therapy_widget.dart';

class TherapyDetailScreen extends StatefulWidget {
  const TherapyDetailScreen({super.key});

  @override
  State<TherapyDetailScreen> createState() => _TherapyDetailScreenState();
}

class _TherapyDetailScreenState extends State<TherapyDetailScreen> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.h),
        child: AppBar(
          elevation: 10, // Adds a bottom shadow
          shadowColor: Colors.black.withOpacity(0.25),
          leading: GestureDetector(
            onTap: () {
              Get.back();
              // navController.resetIndex();
            },
            child: const Icon(
              Icons.keyboard_backspace_outlined,
              color: Colors.grey,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Therapy Plans',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: kDarkColor,
                  fontWeight: FontWeight.bold,
                ),
            // overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: kDarkColor,
                        ),
                  ),
                  Text(
                    '23',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: kTextColor,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
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
                    'All Tasks',
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
                child: SvgPicture.asset('assets/images/scroll-caret-icon.svg'),
              ),
              children: [
                TherapyWidget(
                  onTap: () {
                    Get.to(() => ConsonatsScreen());
                  },
                  title: "Consonants",
                ).paddingSymmetric(horizontal: 25.w),
                20.h.verticalSpace,
                TherapyWidget(
                  onTap: () {
                    Get.to(() => VowelsScreen());
                  },
                  title: "Vowels",
                ).paddingSymmetric(horizontal: 25.w),
                20.h.verticalSpace,
                TherapyWidget(
                  onTap: () {},
                  title: "Re Sound Combinations",
                ).paddingSymmetric(horizontal: 25.w),
                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}

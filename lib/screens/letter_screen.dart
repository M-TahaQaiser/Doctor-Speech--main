import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';
import 'package:TinyDragonTherapy/widgets/video_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LetterScreen extends StatefulWidget {
  const LetterScreen({super.key});

  @override
  State<LetterScreen> createState() => _LetterScreenState();
}

class _LetterScreenState extends State<LetterScreen> {
  final List<String> carouselItems = [
    "The “p” sound is produced in a similar manner as the “K”, except that the vocal cords are in motion for this voiced sound. The back of the tongue must rise to make contact with the roof of the mouth, or palate. Watch the video, then mimic the sound that you hear.",
    "The “p” sound is produced in a similar manner as the “K”, except that the vocal cords are in motion for this voiced sound. The back of the tongue must rise to make contact with the roof of the mouth, or palate. Watch the video, then mimic the sound that you hear.",
    "The “p” sound is produced in a similar manner as the “K”, except that the vocal cords are in motion for this voiced sound. The back of the tongue must rise to make contact with the roof of the mouth, or palate. Watch the video, then mimic the sound that you hear.",
  ];

  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 10, // Adds a bottom shadow
        // shadowColor: Colors.black.withOpacity(0.25),
        leading: GestureDetector(
          onTap: () {
            // navController.resetIndex();
            Get.back();
          },
          child: const Icon(
            Icons.keyboard_backspace_outlined,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Letter name",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: kDarkColor,
                fontWeight: FontWeight.bold,
              ),
          // overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.h.verticalSpace,
          Center(
            child: SizedBox(
              height: 174.h,
              width: 310.w,
              child: const LoopingVideoWidget(
                  assetPath: "assets/images/sample.mp4"),
            ),
          ),
          40.h.verticalSpace,
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 380.0.h,
              enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.7,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: carouselItems.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    // height: 271.h,
                    width: 237.w,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      border: Border.all(color: kPrimaryColor, width: 2.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "What this about?",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                          10.h.verticalSpace,
                          Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          40.h.verticalSpace,
          Center(
            child: SmoothPageIndicator(
              controller: PageController(initialPage: _currentIndex),
              count: carouselItems.length,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 56.w,
                  height: 8.h,
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(24),
                ),
                dotDecoration: DotDecoration(
                  width: 56.w,
                  height: 4.h,
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(24),
                ),
                spacing: 16.r,
              ),
              onDotClicked: (index) {
                _carouselController.animateToPage(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:TinyDragonTherapy/screens/letter_screen.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';

class VowelsScreen extends StatefulWidget {
  VowelsScreen({super.key});

  @override
  _VowelsScreenState createState() => _VowelsScreenState();
}

class _VowelsScreenState extends State<VowelsScreen> {
  final List<String> phonetics = [
    "A",
    "E",
    "I",
    "O",
    "U",
    "AE",
    "IO",
    "UA",
  ];

  List<String> filteredPhonetics = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredPhonetics = phonetics;
    searchController.addListener(() {
      filterPhonetics();
    });
  }

  void filterPhonetics() {
    List<String> results = [];
    if (searchController.text.isEmpty) {
      results = phonetics;
    } else {
      results = phonetics
          .where((phonetic) => phonetic
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredPhonetics = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.h),
        child: AppBar(
          elevation: 10, // Adds a bottom shadow
          shadowColor: Colors.black.withOpacity(0.25),
          leading: GestureDetector(
            onTap: () {
              // navController.resetIndex();
              Get.close(1);
            },
            child: const Icon(
              Icons.keyboard_backspace_outlined,
              color: Colors.grey,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Vowels',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor,
                        boxShadow: [
                          BoxShadow(blurRadius: 3.r, offset: Offset(0, 2.r))
                        ]),
                  ),
                  8.w.horizontalSpace,
                  Text(
                    "Completed",
                    style: CustomTextStyle.basicStyle.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              15.w.horizontalSpace,
              Row(
                children: [
                  Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 3.r, offset: Offset(0, 2.r))
                        ]),
                  ),
                  8.w.horizontalSpace,
                  Text("Pending",
                      style: CustomTextStyle.basicStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      )),
                ],
              ),
            ],
          ),
          17.h.verticalSpace,
          CustomTextField(
            controller: searchController,
            hint: "Search",
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          17.h.verticalSpace,
          Expanded(
            child: GridView.builder(
              itemCount: filteredPhonetics.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 17.h,
                crossAxisSpacing: 30.w,
                mainAxisExtent: 62.h,
              ),
              itemBuilder: (context, index) {
                bool isHighlighted = index < 3; // Highlight first 3 items
                if (filteredPhonetics[index] == "") {
                  return const SizedBox.shrink();
                } else {
                  return GestureDetector(
                    onTap: () {
                      Get.to((() => const LetterScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isHighlighted ? kPrimaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2.r,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          filteredPhonetics[index],
                          style: CustomTextStyle.basicStyle.copyWith(
                            color: isHighlighted ? Colors.white : Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 24.w),
    );
  }
}

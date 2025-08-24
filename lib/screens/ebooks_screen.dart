import 'package:TinyDragonTherapy/controller/navigator_controller.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';
import 'package:TinyDragonTherapy/widgets/book_widget.dart';

class EBooksScreen extends StatelessWidget {
  const EBooksScreen({super.key});
  static const routeName = '/e-books-screen';

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigatorController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.h),
        child: AppBar(
          elevation: 10.h,
          shadowColor: Colors.black.withOpacity(0.25),
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
            'E Books',
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDivider(),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    BookWidget(
                        title: 'Book 1',
                        image: 'assets/images/book-picture.svg',
                        onTap: () {}),
                    BookWidget(
                        title: 'Book 2',
                        image: 'assets/images/book-picture.svg',
                        onTap: () {}),
                    BookWidget(
                        title: 'Book 3',
                        image: 'assets/images/book-picture.svg',
                        onTap: () {}),
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

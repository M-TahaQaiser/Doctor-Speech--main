import 'package:TinyDragonTherapy/screens/book_appointment_screen.dart';
import 'package:TinyDragonTherapy/widgets/row_with_title_and_trailing_widget.dart';
import 'package:TinyDragonTherapy/util/export_all.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen({super.key});
  static const routeName = '/view-profile-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child:
              SvgPicture.asset('assets/images/back-icon.svg', fit: BoxFit.none),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: false,
        title: Text(
          'Sahana V',
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/person-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sahana V',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: kDarkColor,
                                  fontWeight: FontWeight.bold,
                                ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            'Therapist',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: kDarkColor,
                                ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ]),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Lorem ipsum is a dummy text',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: kDarkColor,
                          fontWeight: FontWeight.bold,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    'Lorem ipsum is a dummy text and a filler to replace the text.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: kDarkColor,
                        ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    RowWithTitleAndTrailingWIdget(),
                    RowWithTitleAndTrailingWIdget(),
                    RowWithTitleAndTrailingWIdget(),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Important Dates',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: kDarkColor,
                            fontWeight: FontWeight.bold,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: EdgeInsets.all(15.5.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: const Color.fromRGBO(209, 230, 255, 0.5)),
                        child: SvgPicture.asset(
                          'assets/images/star-icon.svg',
                        ),
                      ),
                      title: Text(
                        'Therapy Course 1',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: kDarkColor,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        '3 November 2019',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: kDarkColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      trailing: Text(
                        '3 y.o',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: kDarkColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const CustomDivider(
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: FilledButton(
                        onPressed: () {
                          // Navigator.of(context).pushNamed(BookAppointmentScreen.routeName);
                          Get.to(() =>  const BookAppointmentScreen());
                        },
                        style: Theme.of(context).filledButtonTheme.style,
                        child: Text(
                          'Book Appointment',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
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

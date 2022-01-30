import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_premier_pearl/core/utils/my_assets.dart';
import 'package:review_premier_pearl/core/utils/my_buttons.dart';
import 'package:review_premier_pearl/core/utils/my_colors.dart';
import 'package:review_premier_pearl/core/utils/my_inputs.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/pages/review_page.dart';
import 'package:review_premier_pearl/feature/review_offline/provider/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormReviewPage extends StatefulWidget {
  static const String routeName = "/FormReviewPage";
  const FormReviewPage({Key? key}) : super(key: key);

  @override
  State<FormReviewPage> createState() => _FormReviewPageState();
}

class _FormReviewPageState extends State<FormReviewPage> {
  DateTime _date = DateTime.now();
  String? fullName;
  late String phoneNumber;
  late String room;
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final roomController = TextEditingController();


  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      initialEntryMode: DatePickerEntryMode.input,
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fullName = "";
    phoneNumber = "";
    room = "";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<LocaleProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ReviewPage(
                          onBoarding: true,
                        )));
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: SizedBox(
        width: size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                provider.setLocale(const Locale('vi'));
              },
              icon: Image.asset(MyAssets.flagVN),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {
                provider.setLocale(const Locale('en'));
              },
              icon: Image.asset(MyAssets.flagUS),
              iconSize: 30,
            ),
          ],
        ),
      ),
      backgroundColor: midnightColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
            child: Column(
              children: [
                input(
                    context: context,
                    hintText: AppLocalizations.of(context)!.labelName,
                    // autofillHints: [AutofillHints.name],
                    controller: fullNameController,
                    onChanged: (value) {
                      fullName = value;
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width / 3,
                      child: input(
                          context: context,
                          hintText: AppLocalizations.of(context)!.labelPhone,keyboardType: TextInputType.number,
                          autofillHints: [AutofillHints.telephoneNumber],
                          controller: phoneNumberController,
                          onChanged: (value) {
                            phoneNumber = value;
                          }),
                    ),
                    SizedBox(
                      width: size.width / 3,
                      child: input(
                          context: context,
                          hintText: AppLocalizations.of(context)!.labelRoom,
                          autofillHints: [AutofillHints.name],
                          controller: roomController,
                          onChanged: (value) {
                            room = value;
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.width / 40,
                ),
                Row(
                  children: [
                    button2(
                      title: AppLocalizations.of(context)!
                          .selectDate
                          .toUpperCase(),
                      context: context,
                      onPressed: _selectDate,
                    ),
                    SizedBox(
                      width: size.width / 20,
                    ),
                    Text(
                      '${AppLocalizations.of(context)!.selectedDate}: ${_date.toString().substring(0, 11)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.width / 40,
                ),
                SizedBox(
                  width: size.width / 5,
                  height: size.width / 20,
                  child: ElevatedButton(
                    child: Text(
                      AppLocalizations.of(context)!.textcontinue,
                      style: TextStyle(
                          color: apacheColors,
                          fontFamily: "Cormorant",
                          fontSize: size.width / 50,
                          fontWeight: FontWeight.w700),
                    ),
                    onPressed: () {
                      // DateTime date2;
                      // if (_time.format(context).contains("M")) {
                      //   date2 = DateFormat("hh:mm a").parse(_time.format(
                      //       context)); // think this will work better for you
                      //   //   print(DateFormat("HH:mm").format(date2));
                      // } else {
                      //   date2 = DateFormat("hh:mm").parse(_time.format(
                      //       context)); // think this will work better for you
                      //   //  print(DateFormat("HH:mm").format(date2));
                      // }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewPage(
                                    room: room,
                                    fullName: fullName,
                                    phoneNumber: phoneNumber,
                                    onBoarding: false,
                                    checkIn:
                                        "${_date.toString().substring(0, 11)}12:00:00",
                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: apacheColors,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(size.width / 50),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

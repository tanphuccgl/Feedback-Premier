import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);
  DateTime _date = DateTime(2022, 01, 01, 01);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

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
  Widget build(BuildContext context) {
    String fullName = "";
    String phoneNumber = "";
    String room = "";
    final fullNameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final roomController = TextEditingController();
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<LocaleProvider>(context, listen: false);
    final locale = provider.locale;
    return Scaffold(
      backgroundColor: midnightColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReviewPage(
                                onBoarding: true,
                              )));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 50, 100, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: input(
                          context: context,
                          hintText: AppLocalizations.of(context)!.labelName,
                          autofillHints: [AutofillHints.name],
                          controller: fullNameController,
                          onChanged: (value) {
                            fullName = value;
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width / 3,
                          child: input(
                              context: context,
                              hintText:
                                  AppLocalizations.of(context)!.labelPhone,
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
                              .selectTime
                              .toUpperCase(),
                          context: context,
                          onPressed: _selectTime,
                        ),
                        SizedBox(
                          width: size.width / 20,
                        ),
                        Text(
                          '${AppLocalizations.of(context)!.selectedTime}: ${_time.format(context)}',
                          style: const TextStyle(color: Colors.white),
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
                          DateTime date2;
                          if (_time.format(context).contains("M")) {
                            date2 = DateFormat("hh:mm a").parse(_time.format(
                                context)); // think this will work better for you
                            print(DateFormat("HH:mm").format(date2));
                          } else {
                            date2 = DateFormat("hh:mm").parse(_time.format(
                                context)); // think this will work better for you
                            print(DateFormat("HH:mm").format(date2));
                          }

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReviewPage(
                                        room: room,
                                        fullName: fullName,
                                        phoneNumber: phoneNumber,
                                        onBoarding: false,
                                        checkIn:
                                            "${_date.toString().substring(0, 11)}${DateFormat("HH:mm").format(date2)}:00",
                                      )));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: apacheColors,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(size.width / 50),
                            )),
                      ),
                    )
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

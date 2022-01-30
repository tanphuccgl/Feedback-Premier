import 'package:flutter/material.dart';
import 'package:review_premier_pearl/core/utils/my_buttons.dart';
import 'package:review_premier_pearl/core/utils/my_colors.dart';
import 'package:review_premier_pearl/core/utils/my_inputs.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/pages/review_page.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/widgets/bottom_bar.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormReviewPage extends StatefulWidget {
  static const String routeName = "/FormReviewPage";
  const FormReviewPage({Key? key}) : super(key: key);

  @override
  State<FormReviewPage> createState() => _FormReviewPageState();
}

class _FormReviewPageState extends State<FormReviewPage> {
  DateTime _date = DateTime.now();
  late String fullName;
  late String phoneNumber;
  late String room;
  late String checkIn;
  late String dateTime;
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final roomController = TextEditingController();

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      initialEntryMode: DatePickerEntryMode.input,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  void _isContinue() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReviewPage(
                  room: room,
                  fullName: fullName,
                  phoneNumber: phoneNumber,
                  isHome: false,
                  checkIn: checkIn,
                )));
  }

  @override
  void initState() {
    super.initState();
    fullName = "";
    phoneNumber = "";
    room = "";
    dateTime = _date.toString().substring(0, 11);
    checkIn = "${dateTime}12:00:00";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final labelName = AppLocalizations.of(context)!.labelName;
    final labelPhone = AppLocalizations.of(context)!.labelPhone;
    final labelRoom = AppLocalizations.of(context)!.labelRoom;
    final selectDate = AppLocalizations.of(context)!.selectDate.toUpperCase();
    final selectedDate = AppLocalizations.of(context)!.selectedDate;
    final textcontinue = AppLocalizations.of(context)!.textcontinue;

    return Scaffold(
      appBar: customAppBar(context),
      bottomNavigationBar: const XBottomBar(),
      backgroundColor: midnightColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
            child: Column(
              children: [
                input(
                    context: context,
                    hintText: labelName,
                    autofillHints: [AutofillHints.name],
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
                          hintText: labelPhone,
                          keyboardType: TextInputType.number,
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
                          hintText: labelRoom,
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
                    elevatedButton(
                      context,
                      title: selectDate,
                      onPressed: _selectDate,
                    ),
                    SizedBox(
                      width: size.width / 20,
                    ),
                    Text(
                      '$selectedDate: $dateTime',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.width / 40,
                ),
                elevatedButton(
                  context,
                  title: textcontinue,
                  onPressed: _isContinue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:law_application/res/colors.dart';
import 'package:law_application/res/components/roundbutton.dart';
import 'package:law_application/views/services/session_manager.dart';
import 'package:table_calendar/table_calendar.dart';

class bookingcalender extends StatefulWidget {
  const bookingcalender({super.key});

  @override
  State<bookingcalender> createState() => _bookingcalenderState();
}

class _bookingcalenderState extends State<bookingcalender> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  DateTime date = DateTime.now();

  TimeOfDay _timeOfDay = TimeOfDay(hour: 7, minute: 45);
  void _ondayselected(DateTime day, DateTime focusedDay) {
    setState(() {
      date = day;
      print(date);
    });
  }

  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
        print(_timeOfDay);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Book Appointment',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  'Cosultation Lawyer',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade50,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 15,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(-5.0, -5.0),
                        blurRadius: 15,
                        spreadRadius: 1.0),
                  ]),
                  child: TableCalendar(
                      headerVisible: true,
                      selectedDayPredicate: (day) => isSameDay(day, date),
                      onDaySelected: _ondayselected,
                      daysOfWeekHeight: 25,
                      calendarStyle: CalendarStyle(),
                      availableGestures: AvailableGestures.all,
                      locale: 'en_Us',
                      rowHeight: 50,
                      calendarFormat: CalendarFormat.month,
                      headerStyle: HeaderStyle(
                          titleCentered: true, formatButtonVisible: false),
                      focusedDay: date,
                      firstDay: DateTime.utc(2023),
                      lastDay: DateTime.utc(2024)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Time is' +
                    date.toString().split(' ')[0] +
                    _timeOfDay.format(context).toString()),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        _showTimePicker();
                      },
                      child: Text(
                        'Pick Time',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                decoration: TextDecoration.underline,
                                color: AppColors.primaryColor),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor)),
                      child: TextButton(
                        child: Text(
                          'Back',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          border: Border.all(color: AppColors.primaryColor)),
                      child: TextButton(
                        child: Text(
                          'Book',
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                        onPressed: () {
                          String id =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          ref
                              .child(SessionController().userid.toString())
                              .child('Appointment')
                              .child(id)
                              .set({
                            'date': date.toString().split(' ')[0],
                            'time': _timeOfDay.format(context).toString()
                          });

                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Booking Confirmed!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Icon(
                                        Icons.check_box,
                                        color: AppColors.successColor,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          'Your booking has been confirmed.Your booking time is ' +
                                              _timeOfDay
                                                  .format(context)
                                                  .toString() +
                                              ' on ' +
                                              date.toString().split(' ')[0]),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      roundButton(
                                          title: 'Check my appointments',
                                          onpress: () {})
                                    ],
                                  ),
                                );
                              }).then((value) {
                            Navigator.pop(context);
                          });
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

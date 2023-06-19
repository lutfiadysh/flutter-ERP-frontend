import 'dart:async';
import 'dart:math';

import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/provider/calendar/calendar_dialog/bloc/calendar_dialog_bloc.dart';
import 'package:admin_dashboard/src/provider/calendar/calendar_drag/bloc/calendar_drag_bloc.dart';
import 'package:admin_dashboard/src/provider/calendar/calendar_format/calendar_format_bloc.dart';
import 'package:admin_dashboard/src/provider/theme/bloc/theme_mode_bloc.dart';
import 'package:admin_dashboard/src/utils/hover.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late final CalendarFormatBloc _calendarFormatBloc = CalendarFormatBloc()
    ..add(CalendarFormatEvent.loading(
        calendarFormat: CalendarFormat.month, eventsList: eventMap));
  final CalendarDragBloc _calendarDragBloc = CalendarDragBloc()
    ..add(const CalendarDragEvent.started(dragStarted: false));

  TextEditingController eventController = TextEditingController();

  PageController? newpageController;

  String dropdownValue = '--Select--';
  bool dragOn = false;

  double currentMonthPageIndex = 0.0;
  String calendarType = 'Month';

  CalendarFormat _calendarFormat = CalendarFormat.month;

  String creatRandomDate({required bool currentmonth}) {
    DateTime date = DateTime(
        DateTime.now().year, DateTime.now().month + (currentmonth ? 1 : 2), 0);
    int rng = Random().nextInt(date.day);

    if (rng == 0) {
      rng = rng + 1;
    }
    String month = DateTime.now().month <= 9
        ? '0${DateTime.now().month}'
        : (DateTime.now().month + (currentmonth ? 0 : 1)).toString();
    String day = rng <= 9 ? '0$rng' : rng.toString();
    return DateTime.parse('${DateTime.now().year}-$month-$day')
        .toString()
        .split(" ")[0];
  }

  late Map<DateTime, List<Map<String, dynamic>>> eventMap = {
    DateTime.parse('${creatRandomDate(currentmonth: true)} 00:00:00.000Z'): [
      {'eventName': 'Holiday', 'dropdownValue': 4}
    ],
    DateTime.parse('${creatRandomDate(currentmonth: true)} 00:00:00.000Z'): [
      {'eventName': 'Shoping', 'dropdownValue': 5}
    ],
    DateTime.parse('${creatRandomDate(currentmonth: true)} 00:00:00.000Z'): [
      {'eventName': 'Leave', 'dropdownValue': 1}
    ],
    DateTime.parse('${creatRandomDate(currentmonth: true)} 00:00:00.000Z'): [
      {'eventName': 'lunch', 'dropdownValue': 3},
      {'eventName': 'Meeting', 'dropdownValue': 4}
    ],
    DateTime.parse('${creatRandomDate(currentmonth: true)} 00:00:00.000Z'): [
      {'eventName': 'Trip', 'dropdownValue': 6}
    ],
    DateTime.parse('${creatRandomDate(currentmonth: true)} 00:00:00.000Z'): [
      {'eventName': 'Visit showroom', 'dropdownValue': 2}
    ],
    DateTime.parse('${creatRandomDate(currentmonth: true)} 00:00:00.000Z'): [
      {'eventName': 'GD', 'dropdownValue': 0}
    ],
    DateTime.parse('${creatRandomDate(currentmonth: false)} 00:00:00.000Z'): [
      {'eventName': 'BirthDay Party', 'dropdownValue': 5}
    ],
    DateTime.parse('${creatRandomDate(currentmonth: false)} 00:00:00.000Z'): [
      {'eventName': 'Repeating Event', 'dropdownValue': 2}
    ],
  };

  List<String> dropDownList = const [
    '--Select--',
    'Danger',
    'Success',
    'Primary',
    'Info',
    'Dark',
    'Warning'
  ];

  List<Color> coloredList = [
    ColorConst.primary,
    ColorConst.error,
    ColorConst.calSuccess,
    ColorConst.primary,
    ColorConst.info,
    ColorConst.dark,
    ColorConst.warning,
  ];

  List<String> months = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    newpageController!.dispose();
    eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => _calendarFormatBloc,
        ),
        BlocProvider(
          create: (_) => _calendarDragBloc,
        ),
      ],
      child: Responsive.isWeb(context)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _mobileView()),
                FxBox.w20,
                Expanded(
                  flex: 6,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: _tableCalendar(context: context),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                _mobileView(),
                FxBox.h20,
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _tableCalendar(context: context),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _mobileView() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 34,
              child: FxButton(
                onPressed: () {
                  _displayTextInputDialog(
                    context: context,
                    savePressed: () {
                      _handleSaveTap(
                          doPopup: true,
                          date: DateTime.parse(
                            '${DateTime.now().toString().split(" ")[0]} 00:00:00.000Z',
                          ),
                          index: null);
                    },
                    deletePressed: () {},
                  );
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 15,
                ),
                text: 'Create Event',
                borderRadius: 40,
              ),
            ),
            FxBox.h24,
            const Text(
              'Drag and drop your event or click in the calendar',
              style: TextStyle(fontSize: 15),
            ),
            FxBox.h12,
            _addEventButtons(
                color: ColorConst.calSuccess,
                label: 'Event Planning',
                colorIndex: 2),
            FxBox.h6,
            _addEventButtons(
                color: ColorConst.info, label: 'Meeting', colorIndex: 4),
            FxBox.h6,
            _addEventButtons(
                color: ColorConst.warning,
                label: 'Generate Reports',
                colorIndex: 6),
            FxBox.h6,
            _addEventButtons(
                color: ColorConst.error.withOpacity(0.8),
                label: 'Theme',
                colorIndex: 1),
            FxBox.h40,
            const Text(
              'Activity',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            FxBox.h16,
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 1.5),
                    child: VerticalDivider(
                      endIndent: 5,
                      indent: 5,
                      color: ColorConst.lightFontColor,
                    ),
                  ),
                  Positioned(
                    left: 25,
                    right: 1,
                    child: SizedBox(
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text.',
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing.',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.fiber_manual_record,
                        size: 20,
                        color: ColorConst.teal,
                      ),
                      Icon(
                        Icons.fiber_manual_record,
                        size: 20,
                        color: ColorConst.teal,
                      ),
                      Icon(
                        Icons.fiber_manual_record,
                        size: 20,
                        color: ColorConst.teal,
                      ),
                    ],
                  ),
                  FxBox.h20
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addEventButtons(
      {required String label, required Color color, required int colorIndex}) {
    return Draggable(
      data: {'eventName': label, 'dropdownValue': colorIndex},
      onDragStarted: () {
        _calendarDragBloc
            .add(const CalendarDragEvent.started(dragStarted: true));
      },
      onDragEnd: (details) => _calendarDragBloc
          .add(const CalendarDragEvent.started(dragStarted: false)),
      feedback: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            enabledMouseCursor: SystemMouseCursors.allScroll,
            backgroundColor: color,
            alignment: Alignment.centerLeft,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          icon: const Icon(
            Icons.fiber_manual_record,
            color: Colors.white,
            size: 12,
          ),
          label: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 34,
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                enabledMouseCursor: SystemMouseCursors.allScroll,
                backgroundColor: color,
                alignment: Alignment.centerLeft,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              icon: const Icon(
                Icons.fiber_manual_record,
                color: ColorConst.white,
                size: 12,
              ),
              label: Text(
                label,
                style: const TextStyle(
                  color: ColorConst.white,
                  fontSize: 15,
                ),
              )),
        ),
      ),
    );
  }

  Widget _eventButton(
      {required List<Map<String, dynamic>> list, required DateTime date}) {
    return Positioned(
      top: 24,
      left: 0,
      right: 0,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              minWidth: 10,
              onPressed: () {
                eventController.text = list[index]["eventName"];
                dropdownValue =
                    dropDownList.elementAt(list[index]["dropdownValue"] ?? 0);
                _displayTextInputDialog(
                  context: context,
                  savePressed: () {
                    _handleSaveTap(date: date, doPopup: true, index: index);
                  },
                  deletePressed: () {
                    list.removeAt(index);
                    eventMap[date] = list;
                    eventController.clear();
                    dropdownValue = '--Select--';
                    _calendarFormatBloc.add(CalendarFormatEvent.loading(
                        calendarFormat: _calendarFormat, eventsList: eventMap));
                    Navigator.pop(context);
                  },
                );
              },
              color: coloredList.elementAt(list[index]["dropdownValue"] ?? 0),
              child: Text(list[index]["eventName"],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(color: ColorConst.white)),
            ),
          );
        },
      ),
    );
  }

  void _handleSaveTap({
    required DateTime date,
    required bool doPopup,
    required int? index,
  }) {
    if (eventController.text.isNotEmpty) {
      bool isContains = eventMap.containsKey(date);
      if (isContains) {
        final values = eventMap[date] as List<Map<String, dynamic>>;
        if (index != null) {
          values[index] = {
            'eventName': eventController.text.trim(),
            'dropdownValue': dropDownList.indexOf(dropdownValue)
          };
        } else {
          values.add({
            'eventName': eventController.text.trim(),
            'dropdownValue': dropDownList.indexOf(dropdownValue)
          });
        }

        eventController.clear();
        eventMap[date] = values;
        dropdownValue = '--Select--';
        _calendarFormatBloc.add(CalendarFormatEvent.loading(
            calendarFormat: _calendarFormat, eventsList: eventMap));
        if (doPopup) {
          Navigator.pop(context);
        }
      } else {
        eventMap[date] = [
          {
            'eventName': eventController.text.trim(),
            'dropdownValue': dropDownList.indexOf(dropdownValue)
          }
        ];
        eventController.clear();
        dropdownValue = '--Select--';
        _calendarFormatBloc.add(CalendarFormatEvent.loading(
            calendarFormat: _calendarFormat, eventsList: eventMap));
        if (doPopup) {
          Navigator.pop(context);
        }
      }
    }
  }

  Widget _tableCalendar({required BuildContext context}) {
    return BlocBuilder<CalendarFormatBloc, CalendarFormatState>(
      builder: (context, state) {
        return state.when(
          initial: () => const CircularProgressIndicator(),
          loaded: (calendarFormat, eventsList) {
            return BlocBuilder<ThemeModeBloc, ThemeModeState>(
              builder: (context1, state1) {
                return state1.when(
                  initial: () => const SizedBox.shrink(),
                  success: (themeMode) => TableCalendar(
                    onCalendarCreated: (pageController) async {
                      newpageController = pageController;
                      await Future.delayed(const Duration(seconds: 2));
                      currentMonthPageIndex == 0.0
                          ? currentMonthPageIndex = pageController.page!
                          : null;
                    },
                    currentDay: DateTime.now(),
                    rowHeight: 100,
                    availableGestures: AvailableGestures.none,
                    daysOfWeekHeight: 40,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    firstDay: DateTime.utc(2015, 10, 16),
                    lastDay: DateTime.utc(2030, 10, 14),
                    focusedDay: DateTime.now(),
                    headerVisible: true,
                    calendarFormat: calendarFormat,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                          color: themeMode
                              ? ColorConst.darkFontColor
                              : ColorConst.lightFontColor),
                      weekendStyle: TextStyle(
                          color: themeMode
                              ? ColorConst.darkFontColor
                              : ColorConst.lightFontColor),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultDecoration: BoxDecoration(
                        border: Border.all(
                            color: themeMode
                                ? ColorConst.calDarkBorder
                                : ColorConst.callighBorder,
                            width: 0.5),
                      ),
                      cellMargin: const EdgeInsets.all(0.0),
                      canMarkersOverflow: true,
                      tableBorder: TableBorder.all(
                        color: themeMode
                            ? ColorConst.calDarkBorder
                            : ColorConst.callighBorder,
                      ),
                    ),
                    headerStyle: const HeaderStyle(
                      titleCentered: true,
                      formatButtonShowsNext: false,
                      formatButtonVisible: false,
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                    ),
                    onDaySelected: (date, events) {
                      _displayTextInputDialog(
                        context: context,
                        savePressed: () {
                          _handleSaveTap(
                              date: date, doPopup: true, index: null);
                        },
                        deletePressed: () {},
                      );
                    },
                    calendarBuilders: CalendarBuilders(
                      headerTitleBuilder: (context, day) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              FxButton(
                                minWidth: 27.5,
                                color: isDark ? ColorConst.primary : null,
                                onPressed: () {
                                  if (newpageController != null) {
                                    newpageController!.previousPage(
                                      duration:
                                          const Duration(microseconds: 400),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                icon: const Icon(
                                  Icons.navigate_before,
                                  color: ColorConst.white,
                                ),
                                borderRadius: 4.0,
                              ),
                              FxBox.w4,
                              FxButton(
                                minWidth: 27.5,
                                color: isDark ? ColorConst.primary : null,
                                onPressed: () {
                                  if (newpageController != null) {
                                    newpageController!.nextPage(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeIn);
                                  }
                                },
                                icon: const Icon(
                                  Icons.navigate_next,
                                  color: ColorConst.white,
                                ),
                                borderRadius: 4.0,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '${months.elementAt(day.month - 1)} ${day.year}'
                                    .toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Responsive.isWeb(context)
                              ? FxButton(
                                  onPressed: () {
                                    if (newpageController!.page !=
                                        currentMonthPageIndex) {
                                      if (newpageController != null) {
                                        newpageController!.jumpToPage(
                                            currentMonthPageIndex.toInt());
                                      }
                                    }
                                  },
                                  text: 'Today',
                                  textColor: Colors.white,
                                  borderRadius: 3,
                                  color: ColorConst.primary.withOpacity(
                                    day.month == DateTime.now().month ? 0.8 : 1,
                                  ),
                                  height: 44.0,
                                )
                              : const SizedBox.shrink(),
                          Responsive.isWeb(context)
                              ? FxBox.w8
                              : const SizedBox.shrink(),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: false,
                              isDense: true,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                              ),
                              buttonHeight: 36.0,
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(color: ColorConst.primary),
                              ),
                              itemHeight: 32,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              dropdownElevation: 4,
                              scrollbarAlwaysShow: false,
                              scrollbarThickness: 6,
                              value: calendarType,
                              onChanged: (value) {
                                if (value != null) {
                                  calendarType = value;
                                  if (value == 'Month') {
                                    _calendarFormat = CalendarFormat.month;
                                  } else if (value == 'Week') {
                                    _calendarFormat = CalendarFormat.week;
                                  } else if (value == '2 Week') {
                                    _calendarFormat = CalendarFormat.twoWeeks;
                                  }
                                  _calendarFormatBloc.add(
                                    CalendarFormatEvent.loading(
                                      calendarFormat: _calendarFormat,
                                      eventsList: eventMap,
                                    ),
                                  );
                                }
                              },
                              items: ['Month', 'Week', '2 Week']
                                  .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                      todayBuilder: (context, date, events) {
                        List<Map<String, dynamic>> list =
                            eventsList[date] ?? [];
                        return _dragTarget(
                          day: date,
                          list: list,
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                color: ColorConst.primary.withOpacity(0.2),
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  date.day.toString(),
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              _eventButton(list: list, date: date)
                            ],
                          ),
                        );
                      },
                      defaultBuilder: (context, day, focusedDay) {
                        List<Map<String, dynamic>> list = eventsList[day] ?? [];
                        return _dragTarget(
                          day: day,
                          list: list,
                          child:
                              BlocBuilder<CalendarDragBloc, CalendarDragState>(
                            builder: (context, state) {
                              return state.when(
                                initial: () => const SizedBox(),
                                dragStart: (dragStarted) => FxHover(
                                  builder: (isHover) => Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        color: isHover && dragStarted
                                            ? ColorConst.info.withOpacity(0.1)
                                            : null,
                                        padding: const EdgeInsets.all(3),
                                        child: Text(
                                          day.day.toString(),
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      _eventButton(list: list, date: day),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _dragTarget(
      {required DateTime day,
      required Widget child,
      required List<Map<String, dynamic>> list}) {
    return DragTarget(
      onWillAccept: (data) {
        return true;
      },
      onAccept: (data) {
        Map<String, dynamic> newMap = data as Map<String, dynamic>;
        eventController.text = newMap["eventName"].toString();
        dropdownValue = dropDownList.elementAt(newMap["dropdownValue"]);
        _handleSaveTap(date: day, doPopup: false, index: null);
      },
      builder: (context, candidateData, rejectedData) => child,
    );
  }

  Future<void> _displayTextInputDialog(
      {required BuildContext context,
      required void Function() savePressed,
      required void Function() deletePressed}) async {
    CalendarDialogBloc calendarDialogBloc = CalendarDialogBloc();
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => calendarDialogBloc
              ..add(
                CalendarDialogEvent.loading(
                  autovalidateMode: AutovalidateMode.disabled,
                  category: dropdownValue,
                  isValidate:
                      eventController.text.trim().isEmpty ? false : true,
                ),
              ),
            child: AlertDialog(
              titlePadding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
                    child: Row(
                      children: [
                        FxBox.w20,
                        const Text(
                          'Event',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          splashRadius: 25,
                          onPressed: () {
                            eventController.clear();
                            dropdownValue = '--Select--';
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.clear,
                            color: ColorConst.lightFontColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey),
                ],
              ),
              content: BlocBuilder<CalendarDialogBloc, CalendarDialogState>(
                  builder: (context, state) {
                return state.when(
                    initial: () => const CircularProgressIndicator(),
                    loaded: (autovalidateMode, category, isValidate) {
                      return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Event Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            FxBox.h10,
                            TextFormField(
                              controller: eventController,
                              autovalidateMode: autovalidateMode,
                              validator: (value) {
                                if (eventController.text.isEmpty) {
                                  return 'Please provide a valid event name';
                                } else {
                                  calendarDialogBloc.add(
                                      CalendarDialogEvent.loading(
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          category: dropdownValue,
                                          isValidate: true));
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "Insert Event Name",
                                  hintStyle: const TextStyle(fontSize: 16),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  suffixIcon: autovalidateMode ==
                                          AutovalidateMode.always
                                      ? Icon(
                                          Icons.error_outline,
                                          color: ColorConst.error,
                                        )
                                      : isValidate
                                          ? const Icon(
                                              Icons.done,
                                              size: 25,
                                              color: ColorConst.teal,
                                            )
                                          : null,
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 0.5)),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: ColorConst.black),
                                      borderRadius: BorderRadius.circular(3))),
                            ),
                            FxBox.h20,
                            const Text(
                              "Category",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            FxBox.h10,
                            Container(
                              height: 35,
                              width: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                  color: ColorConst.grey800,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: category,
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_sharp),
                                    elevation: 16,
                                    onChanged: (String? newValue) {
                                      dropdownValue = newValue!;
                                      calendarDialogBloc.add(
                                        CalendarDialogEvent.loading(
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          category: newValue,
                                          isValidate: eventController.text
                                                  .trim()
                                                  .isEmpty
                                              ? false
                                              : true,
                                        ),
                                      );
                                    },
                                    items: dropDownList
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            )
                          ]);
                    });
              }),
              actions: <Widget>[
                Row(
                  children: [
                    FxButton(
                      onPressed: deletePressed,
                      text: 'Delete',
                      textColor: ColorConst.white,
                      borderRadius: 5,
                      hoverColor: ColorConst.error,
                      color: ColorConst.error.withOpacity(0.7),
                      height: 35,
                    ),
                    const Spacer(),
                    FxButton(
                      onPressed: () {
                        eventController.clear();
                        dropdownValue = '--Select--';
                        Navigator.pop(context);
                      },
                      text: 'Close',
                      buttonType: ButtonType.secondary,
                      borderRadius: 5,
                      height: 35,
                    ),
                    FxBox.w10,
                    FxButton(
                      onPressed: () {
                        if (eventController.text.trim().isEmpty) {
                          calendarDialogBloc.add(
                            CalendarDialogEvent.loading(
                              autovalidateMode: AutovalidateMode.always,
                              category: dropdownValue,
                              isValidate: false,
                            ),
                          );
                        } else {
                          savePressed();
                        }
                      },
                      text: 'Save',
                      buttonType: ButtonType.success,
                      borderRadius: 5,
                      height: 35,
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

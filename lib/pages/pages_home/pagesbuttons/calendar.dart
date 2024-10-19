import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobkit_calendar/mobkit_calendar.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/events.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_calendar/header_calendar.dart';
import 'pages_calendar/onpopup.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

double pageHeight = MediaQuery.of(navigatorKey.currentContext!).size.height;
double pageWidht = MediaQuery.of(navigatorKey.currentContext!).size.width;

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> with TickerProviderStateMixin {
  late TabController _tabController;
  DateTime _currentDate = DateTime.now();
  MobkitCalendarConfigModel getConfig(
      MobkitCalendarViewType mobkitCalendarViewType) {
    return MobkitCalendarConfigModel(
      cellConfig: CalendarCellConfigModel(
        disabledStyle: CalendarCellStyle(
          textStyle:
              TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.5)),
          color: Colors.transparent,
        ),
        enabledStyle: CalendarCellStyle(
          textStyle: const TextStyle(fontSize: 14, color: Colors.black),
          border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
        ),
        selectedStyle: CalendarCellStyle(
          color: Colors.orange,
          textStyle: const TextStyle(fontSize: 14, color: Colors.white),
          border: Border.all(color: Colors.black, width: 1),
        ),
        currentStyle: CalendarCellStyle(
          textStyle: const TextStyle(color: Colors.lightBlue),
        ),
      ),
      calendarPopupConfigModel: CalendarPopupConfigModel(
        popUpBoxDecoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        popUpOpacity: true,
        animateDuration: 100,
        verticalPadding: 30,
        popupSpace: 10,
        popupHeight: MediaQuery.of(context).size.height * 0.6,
        popupWidth: MediaQuery.of(context).size.width,
        viewportFraction: 0.9,
      ),
      topBarConfig: CalendarTopBarConfigModel(
        isVisibleHeaderWidget:
            mobkitCalendarViewType == MobkitCalendarViewType.monthly ||
                mobkitCalendarViewType == MobkitCalendarViewType.agenda,
        isVisibleMonthBar: false,
        isVisibleYearBar: false,
        isVisibleWeekDaysBar: true,
        weekDaysStyle: const TextStyle(fontSize: 14, color: Colors.black),
      ),
      weekDaysBarBorderColor: Colors.black,
      locale: "es",
      disableOffDays: true,
      disableWeekendsDays: false,
      monthBetweenPadding: 20,
      primaryColor: Colors.lightBlue,
      popupEnable: mobkitCalendarViewType == MobkitCalendarViewType.monthly
          ? true
          : false,
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd('es').format(_currentDate);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(
                child: Text(formattedDate.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))),
            elevation: 0,
            bottom: TabBar(
              controller: _tabController,
              padding: EdgeInsets.zero,
              tabs: const <Widget>[
                Tab(
                  text: "Mes",
                ),
                Tab(
                  text: "Semana",
                ),
                Tab(
                  text: "Día",
                ),
                Tab(
                  text: "Agenda",
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              //Mes
              MobkitCalendarWidget(
                headerWidget: (List<MobkitCalendarAppointmentModel> models,
                        DateTime datetime) =>
                    HeaderWidget(
                  datetime: datetime,
                  models: models,
                ),
                minDate: DateTime(1800),
                key: UniqueKey(),
                config: getConfig(MobkitCalendarViewType.monthly),
                dateRangeChanged: (datetime) {
                  setState(() {
                    _currentDate =
                        datetime; // Actualiza el estado con la nueva fecha
                  });
                },
                onSelectionChange: (List<MobkitCalendarAppointmentModel> models,
                        DateTime date) =>
                    null,
                eventTap: (model) => null,
                onPopupWidget: (List<MobkitCalendarAppointmentModel> models,
                        DateTime datetime) =>
                    OnPopupWidget(
                  datetime: datetime,
                  models: models,
                ),
                onDateChanged: (DateTime datetime) => null,
                mobkitCalendarController: MobkitCalendarController(
                  viewType: MobkitCalendarViewType.monthly,
                  appointmentList: eventList,
                ),
              ),
              //Semana
              MobkitCalendarWidget(
                minDate: DateTime(1800),
                config: getConfig(MobkitCalendarViewType.weekly),
                key: UniqueKey(),
                dateRangeChanged: (dateTime) => null,
                weeklyViewWidget:
                    (Map<DateTime, List<MobkitCalendarAppointmentModel>> val) =>
                        Expanded(
                  child: ListView.builder(
                    itemCount: val.length,
                    itemBuilder: (BuildContext context, int index) {
                      DateTime dateTime = val.keys.elementAt((index));
                      return val[dateTime] != null
                          ? Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat("dd MMMM").format(dateTime),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    val[dateTime]!.isNotEmpty
                                        ? SizedBox(
                                            height: val[dateTime]!.length * 45,
                                            child: ListView.builder(
                                              itemCount: val[dateTime]!.length,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return GestureDetector(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height: 40,
                                                            color:
                                                                val[dateTime]![
                                                                        index]
                                                                    .color,
                                                            width: 3,
                                                          ),
                                                          const SizedBox(
                                                              width: 12),
                                                          Flexible(
                                                            child: Text(
                                                              val[dateTime]![
                                                                          index]
                                                                      .title ??
                                                                  "",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : Container(),
                                  ]),
                            )
                          : Container();
                    },
                  ),
                ),
                onSelectionChange: (List<MobkitCalendarAppointmentModel> models,
                        DateTime date) =>
                    null,
                eventTap: (model) => null,
                onPopupWidget: (List<MobkitCalendarAppointmentModel> models,
                        DateTime datetime) =>
                    OnPopupWidget(
                  datetime: datetime,
                  models: models,
                ),
                onDateChanged: (DateTime datetime) => null,
                mobkitCalendarController: MobkitCalendarController(
                  viewType: MobkitCalendarViewType.weekly,
                  appointmentList: eventList,
                ),
              ),
              //Día
              MobkitCalendarWidget(
                minDate: DateTime(1800),
                key: UniqueKey(),
                config: getConfig(MobkitCalendarViewType.daily),
                dateRangeChanged: (datetime) => null,
                onSelectionChange: (models, date) => null,
                eventTap: (model) => null,
                onPopupWidget: (models, datetime) => OnPopupWidget(
                  datetime: datetime,
                  models: models,
                ),
                onDateChanged: (DateTime datetime) => null,
                mobkitCalendarController: MobkitCalendarController(
                  viewType: MobkitCalendarViewType.daily,
                  appointmentList:
                      eventList, // Verifica que esta lista tenga datos
                ),
              ),
              //Agenda
              MobkitCalendarWidget(
                minDate: DateTime(1800),
                key: UniqueKey(),
                config: getConfig(MobkitCalendarViewType.agenda),
                dateRangeChanged: (datetime) => null,
                onSelectionChange: (List<MobkitCalendarAppointmentModel> models,
                        DateTime date) =>
                    null,
                eventTap: (model) => null,
                onPopupWidget: (List<MobkitCalendarAppointmentModel> models,
                        DateTime datetime) =>
                    OnPopupWidget(
                  datetime: datetime,
                  models: models,
                ),
                onDateChanged: (DateTime datetime) => null,
                mobkitCalendarController: MobkitCalendarController(
                  viewType: MobkitCalendarViewType.agenda,
                  appointmentList: eventList,
                ),
              )
            ],
          ),
        ));
  }
}

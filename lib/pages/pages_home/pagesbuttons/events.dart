import 'package:flutter/material.dart';
import 'package:mobkit_calendar/mobkit_calendar.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_events/add_events.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_events/show_events.dart';

List<MobkitCalendarAppointmentModel> eventList = [];

class MyCalendarEvent extends StatefulWidget {
  const MyCalendarEvent({super.key});

  @override
  State<MyCalendarEvent> createState() => _MyCalendarEventsState();
}

class _MyCalendarEventsState extends State<MyCalendarEvent> {
  // Función para agregar eventos a la lista
  void _addEvents(MobkitCalendarAppointmentModel model) {
    setState(() {
      eventList.add(model);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const Text(
                'Eventos',
                style: TextStyle(fontSize: 24.0),
              ),
              Expanded(
                child: ShowEvents(
                  eventList: eventList,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            // Botón para agregar eventos
            child: AddEvents(
              onAddEvents: _addEvents, // Pasar la función para agregar eventos
            ),
          ),
        ],
      ),
    );
  }
}

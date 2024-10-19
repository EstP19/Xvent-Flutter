import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/addition.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/calendar.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/data.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/events.dart';

class ButtonsFeed extends StatefulWidget {
  const ButtonsFeed({super.key});

  @override
  State<ButtonsFeed> createState() => _ButtonsFeedState();
}

class _ButtonsFeedState extends State<ButtonsFeed> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const MyCalendarEvent(),
    const Calendario(),
    const AddClient(),
    const Statistics() // Cambié _ChartApp por ChartApp (sin el "_")
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.event_repeat_outlined),
            label: 'Eventos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Agregar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Estadística',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

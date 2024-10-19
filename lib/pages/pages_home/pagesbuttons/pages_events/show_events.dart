import 'package:flutter/material.dart';
import 'package:mobkit_calendar/mobkit_calendar.dart';
import 'package:intl/intl.dart';

class ShowEvents extends StatelessWidget {
  final List<MobkitCalendarAppointmentModel> eventList;

  const ShowEvents({
    super.key,
    required this.eventList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
        ),
      ),
      child: eventList.isNotEmpty
          ? ListView.builder(
              itemCount: eventList.length,
              itemBuilder: (context, index) {
                final event = eventList[index];
                final startDateFormatted =
                    DateFormat('yyyy-MM-dd').format(event.appointmentStartDate);
                final startHourFormatted = DateFormat('HH:mm')
                    .format(event.appointmentStartDate); // Formato 24 horas
                final endDateFormatted =
                    DateFormat('yyyy-MM-dd').format(event.appointmentEndDate);
                final endHourFormatted = DateFormat('HH:mm')
                    .format(event.appointmentEndDate); // Formato 24 horas

                // Usar un nombre por defecto si no hay más nombres

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Producto: ${event.title}', // Mostrar el nombre del cliente
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Cliente: ${event.detail}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Inicio: $startDateFormatted a las $startHourFormatted',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Fin: $endDateFormatted a las $endHourFormatted',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(child: Text('No hay eventos aún')),
    );
  }
}

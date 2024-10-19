import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsClient extends StatelessWidget {
  const StatisticsClient({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Gráfico de barras para mostrar los clientes con más reservas
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Top Clientes por Reservas'),
              legend: Legend(isVisible: false),
              series: <CartesianSeries>[
                BarSeries<_ClientData, String>(
                  dataSource: [
                    _ClientData('María García', 16),
                    _ClientData('Pedro Sánchez', 12),
                    _ClientData('Ana Martínez', 9),
                    _ClientData('Carlos Pérez', 5),
                  ],
                  xValueMapper: (_ClientData data, _) => data.clientName,
                  yValueMapper: (_ClientData data, _) => data.reservations,
                  color: Colors.deepPurpleAccent,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
          // Tarjetas de detalles para cada cliente
          ClientReservationCard(
            clientName: 'Juan Pérez',
            reservations: 15,
            amountSpent: 750,
          ),
          ClientReservationCard(
            clientName: 'María García',
            reservations: 16,
            amountSpent: 800,
          ),
          ClientReservationCard(
            clientName: 'Pedro Sánchez',
            reservations: 12,
            amountSpent: 600,
          ),
          ClientReservationCard(
              clientName: 'Carlos Pérez', reservations: 5, amountSpent: 250)
        ],
      ),
    );
  }
}

// Modelo de datos para los clientes
class _ClientData {
  _ClientData(this.clientName, this.reservations);

  final String clientName;
  final int reservations;
}

// Tarjeta personalizada para mostrar las reservas y el gasto total de cada cliente
class ClientReservationCard extends StatelessWidget {
  final String clientName;
  final int reservations;
  final double amountSpent;

  const ClientReservationCard({
    super.key,
    required this.clientName,
    required this.reservations,
    required this.amountSpent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: Text(clientName, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$reservations Reservas\n\$$amountSpent gastados'),
        trailing: Icon(Icons.person),
      ),
    );
  }
}

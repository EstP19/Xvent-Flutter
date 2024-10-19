import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsProducts extends StatelessWidget {
  const StatisticsProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Gráfico de barras para mostrar las estadísticas de productos
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Ingresos por Producto'),
              legend: Legend(isVisible: false),
              series: <CartesianSeries>[
                BarSeries<_ProductIncomeData, String>(
                  dataSource: [
                    _ProductIncomeData('Cancha 1', 5000),
                    _ProductIncomeData('Cancha 2', 3200),
                    _ProductIncomeData('Cancha 3', 4500),
                    _ProductIncomeData('Cancha 4', 3700),
                  ],
                  xValueMapper: (_ProductIncomeData data, _) =>
                      data.productName,
                  yValueMapper: (_ProductIncomeData data, _) => data.income,
                  color: Colors.greenAccent,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
          // Tarjetas de detalles para cada producto
          ProductIncomeCard(productName: 'Cancha 1', income: 5000, sales: 150),
          ProductIncomeCard(productName: 'Cancha 2', income: 3200, sales: 120),
          ProductIncomeCard(productName: 'Cancha 3', income: 4500, sales: 140),
          ProductIncomeCard(productName: 'Cancha 4', income: 3700, sales: 130),
        ],
      ),
    );
  }
}

// Modelo de datos para los productos
class _ProductIncomeData {
  _ProductIncomeData(this.productName, this.income);

  final String productName;
  final double income;
}

// Tarjeta personalizada para mostrar los ingresos y las ventas de cada producto
class ProductIncomeCard extends StatelessWidget {
  final String productName;
  final double income;
  final int sales;

  const ProductIncomeCard({
    super.key,
    required this.productName,
    required this.income,
    required this.sales,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: Text(productName, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$income USD\n$sales ventas'),
        trailing: Icon(Icons.price_check_outlined),
      ),
    );
  }
}

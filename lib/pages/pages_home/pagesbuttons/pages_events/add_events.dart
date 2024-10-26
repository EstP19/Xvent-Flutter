import 'package:flutter/material.dart';
import 'package:mobkit_calendar/mobkit_calendar.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/client_class.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/product_class.dart';

class AddEvents extends StatefulWidget {
  final Function(MobkitCalendarAppointmentModel) onAddEvents;

  const AddEvents({
    super.key,
    required this.onAddEvents,
  });

  @override
  State<AddEvents> createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;
  String?
      _selectedClientName; // Variable para almacenar el cliente seleccionado
  String?
      _selectedProductName; // Variable para almacenar el Producto seleccionado
  final List<Client> _clients = [
    Client(name: 'Juan Pérez', cedula: '123456789', phone: '555-1234'),
    Client(name: 'María Gómez', cedula: '987654321', phone: '555-5678'),
    Client(name: 'Pedro Sánchez', cedula: '123456767', phone: '555-1267'),
    Client(name: 'Carlos Pérez', cedula: '987654345', phone: '555-5692'),
  ];

  final List<ProductS> _products = [
    ProductS(name: 'Cancha 1', price: '70000'),
    ProductS(name: 'Cancha 2', price: '60000'),
    ProductS(name: 'Cancha 3', price: '80000'),
    ProductS(name: 'Cancha 4', price: '90000')
  ];
  final String _searchQuery = ''; // Variable para almacenar la búsqueda

  // Método para seleccionar la fecha de inicio
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  // Método para seleccionar la fecha de fin
  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  // Método para seleccionar la hora de inicio
  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedStartTime) {
      setState(() {
        _selectedStartTime = picked;
      });
    }
  }

  // Método para seleccionar la hora de fin
  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedEndTime) {
      setState(() {
        _selectedEndTime = picked;
      });
    }
  }

  // Añadir el evento a la lista llamando a la función pasada
  void _addAppointment() {
    // Si no se selecciona la fecha, por defecto es hoy
    final selectedStartDate = _startDate ?? DateTime.now();
    final selectedEndDate = _endDate ?? selectedStartDate;

    // Si no se selecciona la hora, por defecto la hora de inicio es la hora actual
    final selectedStartTime = _selectedStartTime ?? TimeOfDay.now();
    final selectedEndTime = _selectedEndTime ??
        selectedStartTime.replacing(
          hour: (selectedStartTime.hour + 1) % 24,
        );

    // Combinar la fecha y la hora seleccionadas en un DateTime
    final startDateTime = DateTime(
      selectedStartDate.year,
      selectedStartDate.month,
      selectedStartDate.day,
      selectedStartTime.hour,
      selectedStartTime.minute,
    );
    final endDateTime = DateTime(
      selectedEndDate.year,
      selectedEndDate.month,
      selectedEndDate.day,
      selectedEndTime.hour,
      selectedEndTime.minute,
    );

    // Si no se selecciona cliente, usar "Sin cliente" como valor predeterminado
    final selectedClientName = _selectedClientName ?? "Sin cliente";
    final selectedProductName = _selectedProductName ?? "Sin product0";

    final newEvent = MobkitCalendarAppointmentModel(
      title: selectedProductName, // Usa el nombre del cliente como título
      appointmentStartDate: startDateTime,
      appointmentEndDate: endDateTime,
      isAllDay: false,
      color: Colors.green,
      detail: selectedClientName,
      recurrenceModel: null,
    );

    widget.onAddEvents(newEvent); // Llamar a la función pasada
    Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
  }

  void _showProductSelection() {
    final filteredProducts = _products.where((product) {
      return product.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Seleccione un producto'),
            content: SizedBox(
              width: double.maxFinite, // Establece el ancho máximo del diálogo
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.price),
                    // Puedes mostrar más información si lo deseas
                    onTap: () {
                      // Almacena el cliente seleccionado y cierra el diálogo
                      setState(() {
                        _selectedProductName =
                            product.name; // Almacena el nombre del cliente
                      });
                      Navigator.of(context).pop(); // Cierra el diálogo
                    },
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el diálogo
                },
                child: const Text('Cancelar'),
              ),
            ],
          );
        });
  }

  void _showClientSelection() {
    final filteredClients = _clients.where((client) {
      return client.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selecciona un cliente'),
          content: SizedBox(
            width: double.maxFinite, // Para que el diálogo use todo el ancho
            child: ListView.builder(
              itemCount: filteredClients.length,
              itemBuilder: (context, index) {
                final client = filteredClients[index];
                return ListTile(
                  title: Text(client.name),
                  subtitle: Text(client
                      .cedula), // Puedes mostrar más información si lo deseas
                  onTap: () {
                    // Almacena el cliente seleccionado y cierra el diálogo
                    setState(() {
                      _selectedClientName =
                          client.name; // Almacena el nombre del cliente
                    });
                    Navigator.of(context).pop(); // Cierra el diálogo
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Muestra un diálogo para agregar evento
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
              title: const Text('Agregar Evento'),
              content: SizedBox(
                  height: 400,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _selectStartDate(context),
                          child: const Text('Fecha de Inicio'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _selectEndDate(context),
                          child: const Text('Fecha Final'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _selectStartTime(context),
                          child: const Text('Hora de Inicio'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _selectEndTime(context),
                          child: const Text('Hora Final'),
                        ),
                      ),
                      // Botón para seleccionar cliente
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _showClientSelection,
                          child: const Text('Seleccionar Cliente'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _showProductSelection,
                          child: const Text('Seleccionar Producto'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _addAppointment,
                          child: const Text('Añadir Evento'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancelar'),
                        ),
                      ),
                    ],
                  ))),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        fixedSize: const Size(75, 75),
        padding: EdgeInsets.zero,
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 55,
      ),
    );
  }
}

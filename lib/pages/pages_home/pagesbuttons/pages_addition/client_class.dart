// Clase para representar un cliente

class Client {
  final String name;
  final String cedula;
  final String phone;

  Client({required this.name, required this.cedula, required this.phone});
}

void main() {
  Client client1 =
      Client(name: 'Juan Pérez', cedula: '123456789', phone: '555-1234');
  Client client2 =
      Client(name: 'Ana Gómez', cedula: '987654321', phone: '555-5678');
}

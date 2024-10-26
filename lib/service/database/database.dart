import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> createClient(String name, String cedula, String phone) async {
  final supabase = Supabase.instance.client;
  final userId = supabase.auth.currentUser?.id;

  if (userId == null) {
    print('Error: Usuario no autenticado');
    return;
  }

  final response = await supabase.from('CLIENTES').insert([
    {
      'name': name,
      'cedula': cedula,
      'telefono': phone,
    },
  ]);

  // Verifica si `response` no es null y maneja posibles errores
  if (response != null && response.error != null) {
    print('Error al insertar cliente: ${response.error!.message}');
  } else if (response != null && response.data != null) {
    print('Cliente insertado exitosamente: ${response.data}');
  } else {
    print('Error inesperado: respuesta nula o datos nulos');
  }
}

Future<PostgrestList?> readClient() async {
  final supabase = Supabase.instance.client;
  final userId = supabase.auth.currentUser?.id;

  // Verifica si se encontró el ID del usuario
  if (userId == null) {
    print("No se encontró el ID del usuario.");
    return null;
  }

  try {
    // Realiza la consulta a la tabla CLIENTES y espera la respuesta
    final response = await supabase.from('CLIENTES').select().eq('id', userId);

    // Devuelve directamente el cliente
    return response;
  } catch (e) {
    // Maneja la excepción sin imprimir el error
    print("Excepción al leer cliente: $e");
    return null; // Retorna null si ocurre una excepción
  }
}

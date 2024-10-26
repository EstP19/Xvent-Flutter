import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trabajo/pages/pages_login/create.dart';
import 'package:trabajo/pages/pages_login/intoapp.dart';
import 'package:trabajo/pages/pages_login/recuperate.dart';

class Datos extends StatefulWidget {
  const Datos({super.key});

  @override
  State<Datos> createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  final _formKey = GlobalKey<FormState>(); // Clave global del formulario
  final SupabaseClient supabase = Supabase.instance.client;
  final TextEditingController _controllerEmailLogin = TextEditingController();
  final TextEditingController _controllerPasswordLogin =
      TextEditingController();

  bool obs = true;
  bool valor = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      // Formulario envuelto en un widget Form
      key: _formKey, // Asignamos la clave
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de Email
            const Text(
              'Email',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _controllerEmailLogin,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                hintText: 'example@email.com',
              ),
              validator: (value) {
                // Validación del campo email
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un email';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Ingresa un email válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 5),

            // Campo de Contraseña
            const Text(
              'Contraseña',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _controllerPasswordLogin,
              keyboardType: TextInputType.visiblePassword,
              obscureText: obs,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                hintText: 'Ingresa tu contraseña',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obs = !obs;
                    });
                  },
                  icon: Icon(
                    obs
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
              ),
              validator: (value) {
                // Validación del campo contraseña
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu contraseña';
                }
                if (value.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 5),

            // Widget de "Recordarme"
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Recordarme',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Checkbox(
                    value: valor,
                    onChanged: (value) {
                      setState(() {
                        valor = !valor;
                      });
                    }),
              ],
            ),
            Remember(), // recordar cuenta
            const SizedBox(height: 15),
            // Botón para validar el formulario
            Botones(
              formKeyLogin: _formKey,
              controllerEmailLogin: _controllerEmailLogin,
              controllerPasswordLogin: _controllerPasswordLogin,
            ),
            const SizedBox(height: 3),
            const NuevaCuenta(), // Crear nueva cuenta
          ],
        ),
      ),
    );
  }
}

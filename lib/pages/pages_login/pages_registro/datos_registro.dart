import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trabajo/pages/pages_login/pages_registro/buttons_registro.dart';

class DatosRegistro extends StatefulWidget {
  const DatosRegistro({super.key});

  @override
  State<DatosRegistro> createState() => _DatosRegistroState();
}

class _DatosRegistroState extends State<DatosRegistro> {
  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();
  final SupabaseClient supabase = Supabase.instance.client;
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  bool obs = true;
  bool obs2 = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      // Formulario envuelto en un widget Form
      key: _formKeyRegister, // Asignamos la clave
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Nombre',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
              controller: _controllerName,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                hintText: 'Ingresa tu nombre',
              ),
              validator: (value) {
                // Validación del campo email
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un Nombre';
                }
                return null;
              }),
          // Campo de Email
          const Text(
            'Email',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: _controllerEmail,
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
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: _controllerPassword,
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

          const SizedBox(
            height: 15,
          ),
          ButtonsRegistro(
            formKeyRegister: _formKeyRegister,
            controllerName: _controllerName,
            controllerEmail: _controllerEmail,
            controllerPassword: _controllerPassword,
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Formulario(),
    );
  }
}

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _cedulaController = TextEditingController();
  String _sexo = '';
  String _estadocivil = '';

  @override
  void dispose() {
    _nombreController.dispose();
    _cedulaController.dispose();
    super.dispose();
  }

  void _enviarFormulario() {
    if (_formKey.currentState!.validate()) {
      // Lógica para enviar el formulario
      String nombre = _nombreController.text;
      String cedula = _cedulaController.text;
      print('Nombre: $nombre');
      print('Cédula: $cedula');
      print('Sexo: $_sexo');
      print('Estadocivil: $_estadocivil');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese su nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _cedulaController,
                decoration: InputDecoration(
                  labelText: 'Cédula',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese su cédula';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text('Seleccione su genero'),
              RadioListTile(
                title: Text('Masculino'),
                value: 'Masculino',
                groupValue: _sexo,
                onChanged: (value) {
                  setState(() {
                    _sexo = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('Femenino'),
                value: 'Femenino',
                groupValue: _sexo,
                onChanged: (value) {
                  setState(() {
                    _sexo = value.toString();
                  });
                },
              ),
              Text('Estado Civil'),
              RadioListTile(
                title: Text('Soltero'),
                value: 'Soltero',
                groupValue: _estadocivil,
                onChanged: (value) {
                  setState(() {
                    _estadocivil = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('Casado'),
                value: 'Casado',
                groupValue: _estadocivil,
                onChanged: (value) {
                  setState(() {
                    _estadocivil = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('Divorciado'),
                value: 'Divorciado',
                groupValue: _estadocivil,
                onChanged: (value) {
                  setState(() {
                    _estadocivil = value.toString();
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _enviarFormulario,
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

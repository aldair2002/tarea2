import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
          )
        )
      ),
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _selectedOperation = 'Suma';
  String _result = '';

  void _calculate() {
    final double? value1 = double.tryParse(_controller1.text);
    final double? value2 = double.tryParse(_controller2.text);

    if (value1 == null || value2 == null) {
      setState(() {
        _result = 'Por favor, ingresa números válidos';
      });
      return;
    }

    double calculationResult;

    switch (_selectedOperation) {
      case 'Suma':
        calculationResult = value1 + value2;
        break;
      case 'Resta':
        calculationResult = value1 - value2;
        break;
      case 'Multiplicación':
        calculationResult = value1 * value2;
        break;
      case 'División':
        if (value2 == 0) {
          setState(() {
            _result = 'No se puede dividir entre cero';
          });
          return;
        }
        calculationResult = value1 / value2;
        break;
      default:
        setState(() {
          _result = 'Operación no válida';
        });
        return;
    }

    setState(() {
      _result = 'Resultado: $calculationResult';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operaciones'),
        backgroundColor: const Color.fromARGB(255, 2, 120, 216),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Entrada1',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _controller1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa un valor aquí',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Text(
              'Entrada 2:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _controller2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa un valor aquí',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Text(
              'Selecciona una operación:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: _selectedOperation,
              items: <String>['Suma', 'Resta', 'Multiplicación', 'División']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOperation = newValue!;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16),
            Text(
              _result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

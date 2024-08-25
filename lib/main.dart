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
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operaciones',
      style: TextStyle(color: Colors.white)
        ),
        backgroundColor:Color.fromARGB(255, 50, 10, 230),
      ),
      home:calculadoraPage();
    );
  }
}

class CalculadoraPage extends StatefulWidget{
  @override
  _calculadoraPage createState() = > _calculadoraPage(),
  }

class _CalculadoraPageState extends State<CalculadoraPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _selectedOperation = 'Suma';
  String _resultado = '';

 void _calculate() {
    final double num1 = double.tryParse(_num1Controller.text) ?? 0;
    final double num2 = double.tryParse(_num2Controller.text) ?? 0;
    double result;
 }

}

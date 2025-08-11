import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locus-Solus App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Locus-Solus')),
        body: const Center(child: HelloWidget()),
      ),
    );
  }
}

class HelloWidget extends StatefulWidget {
  const HelloWidget({super.key});
  @override
  State<HelloWidget> createState() => _HelloWidgetState();
}

class _HelloWidgetState extends State<HelloWidget> {
  String _message = 'Cargando...';

  @override
  void initState() {
    super.initState();
    _fetchHello();
  }

  Future<void> _fetchHello() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8082/auth/test'),
    );
    if (response.statusCode == 200) {
      setState(() {
        _message = response.body;
      });
    } else {
      setState(() {
        _message = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message);
  }
}

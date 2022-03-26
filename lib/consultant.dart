import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'consultant/consultant_item.dart';

class ConsultantPage extends StatefulWidget {
  const ConsultantPage({Key? key}) : super(key: key);

  @override
  _ConsultantPageState createState() => _ConsultantPageState();
}

class _ConsultantPageState extends State<ConsultantPage> {
  List<ConsultantItem> _consultItem = [];

  void fetchConsultantItem() async {
    // final response = await http.get(Uri.parse())
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('相談')),
    );
  }
}

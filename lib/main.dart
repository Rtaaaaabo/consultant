import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'home.dart';
import 'consultant_chat.dart';

void main() {
  runApp(const CooperateApp());
}

class CooperateApp extends StatelessWidget {
  const CooperateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green.shade300,
      ),
      home: const TopPage(),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  static List<Widget> _pageList = [
    const HomePage(),
    const ConsultantPage(),
    const ConsultantChatPage(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '相談',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: '寄附',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn);
        },
      ),
    );
  }
}

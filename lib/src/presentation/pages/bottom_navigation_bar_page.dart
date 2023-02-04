import 'package:flutter/material.dart';
import 'package:flutter_spring_login/src/presentation/pages/add_item.dart';
import 'package:flutter_spring_login/src/presentation/pages/search2.dart';

import '../presentation.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _index = 0;
  List pages=[
    Search2(),
    AddItem()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body:pages[_index],
    bottomNavigationBar: BottomNavigationBar(
      onTap: (newIndex) => setState(() => _index = newIndex),
      currentIndex: _index,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add New'),
        // BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      ],
    ),
    );
  }
}

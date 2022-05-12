import 'package:flutter/material.dart';

import 'Mainmini/data.dart';
import 'Mainmini/image.dart';


class Location extends StatefulWidget {
  final String documetId;
  const Location({ Key? key, required this.documetId }) : super(key: key);
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location>{
 int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Data(documetId: widget.documetId,),
      Images(documetId: widget.documetId,),
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.data_usage),
        label: 'DATE',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.add_location_alt_sharp),
        label: 'IMAGE',
      ),
    ];
    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottmonNavBarItems,
      unselectedItemColor: Colors.white,
      currentIndex: _currentTabIndex,
      selectedItemColor: Colors.yellow,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        title: Text("name"),
      ),
       body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
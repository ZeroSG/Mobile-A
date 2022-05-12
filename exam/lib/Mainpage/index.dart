

import 'package:flutter/material.dart';
import 'dart:convert';

import 'location.dart';


class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index>
    with SingleTickerProviderStateMixin {

  String? _province ;
 final List<String> provinces = [
    'Restaurant',
    'Bakery',
    'Cafe',
  ];


  late double screenW, screenH;
  @override
  Widget build(BuildContext context) {
    // var room = rooms[rooms.length];
    screenW = MediaQuery.of(context).size.width;
    screenH = MediaQuery.of(context).size.height;
    var buildMenuItem;
    return Scaffold(
      appBar: AppBar(
        title: Container(child: Image.asset('images/1.png'),
        width: screenW *0.13),
        actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.perm_identity,
        color: Colors.white,
      ),
      onPressed: () {
      },
    )
  ],
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
                      child: Column(
              children: <Widget>[
                SizedBox(height: 15.0),
                Text(
                  'Place List',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  )
                  ),
                  SizedBox(height: 15.0),
                  buildprovince(),
                  SizedBox(height: 15.0),
                  buildName(),
                  SizedBox(height: 15.0),
                 data(context)
            //       Column(
            //         children: [
            //           Card(
            //   clipBehavior: Clip.antiAlias,
            //    child: InkWell(
            //                  onTap: () {
            //    Navigator.pushNamed(context, '/iocation');
            //                   },
            //   child: Column(
            //     children: [
            //       ListTile(
            //             title: const Text('Cantina Wine Bar & Italian Kitchen'),
            //           ),
            //       Image.asset('images/1.png'),
            //           ListTile(
            //             title: const Text('10:00 AM - 6:00 PM'),
            //             subtitle: Text(
            //               '4.5',
            //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //             ),
            //           ),  
            //     ],
            //   ),
            // ),),
            //         ],
            //       ),
              ],
            ),
          ),
        )),
    );
  }

  Container data(BuildContext context) {
    return Container(
      height: screenH *0.5,
      child: Card(
        elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child:  FutureBuilder(builder: (context, snapshot){
                      var showData= json.decode(snapshot.data.toString());
                      return ListView.builder(
                        itemCount: showData.length,
                        itemBuilder: (BuildContext context, int index){

                          return InkWell(
                             onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Location(documetId: showData[index]['name'],),),
                    ),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(showData[index]['name']),
                                ),
                                Image.network(showData[index]['profile_image_url']),
                                ListTile(
                                  title: Text(showData[index]['address']),
                              subtitle: Text(
                                 showData[index]['rating'].toString(),
                               style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                                  
                                ),
                              ],
                            ),
                          );
                          
                        },);

                    }, future: DefaultAssetBundle.of(context).loadString('assets/example_data.json'),
                    ),),
      ),
    );
  }
 
Container buildprovince() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white54,
      ),
      margin: EdgeInsets.only(top: 16),
      width: screenW * 0.75,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
            decoration: InputDecoration(
              labelText: 'restaurant',
              enabledBorder: OutlineInputBorder(
                //กรอบสี่เหลี่ยม
                borderRadius: BorderRadius.circular(20), //ขนาดมุม
              ),
              focusedBorder: OutlineInputBorder(
                //กรอบสี่เหลี่ยม
                borderRadius: BorderRadius.circular(20), //ขนาดมุม
              ),
            ),
            value: _province,
            // value: snapshot.data!.docs.first,R
            items: provinces.map((province) {
              return DropdownMenuItem(
                value: province,
                child: Text(
                  '$province',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              );
            }).toList(),
            onChanged: (valueSelectedByUser) {
              print("$valueSelectedByUser");  
            }
            ),
      ),
    );
  }
  Container buildName() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white54,
        ),
        margin: EdgeInsets.only(top: 16), //ขนาดแยกบน
        width: screenW * 0.75,
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Namerestaurant : ',
            enabledBorder: OutlineInputBorder(
              //กรอบสี่เหลี่ยม
              borderRadius: BorderRadius.circular(20),),
            focusedBorder: OutlineInputBorder(
              //กรอบสี่เหลี่ยม
              borderRadius: BorderRadius.circular(20), //ขนาดมุม
              // borderSide: BorderSide(color: MyStyle().darkColor),
            ),
          ),
        ));
  }
}
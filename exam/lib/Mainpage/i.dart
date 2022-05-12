import 'package:flutter/material.dart';
import 'dart:convert';

class I extends StatefulWidget {

  
  const I({ Key? key }) : super(key: key);
  
  @override
  State<I> createState() => _IState();
}
late double screenW, screenH;
class _IState extends State<I> {
  @override
  Widget build(BuildContext context) {
        screenW = MediaQuery.of(context).size.width;
    screenH = MediaQuery.of(context).size.height;
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
        height: screenH *0.4,
        child: Card(
          elevation: 4,
                            margin: EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child:  FutureBuilder(builder: (context, snapshot){
                        var showData= json.decode(snapshot.data.toString());
                        return ListView.builder(
                          itemCount: showData.length,
                          itemBuilder: (BuildContext context, int index){
                            return ListTile(
                              title: Text(showData[index]['name']),
                              
                            );
                            
                          },);

                      }, future: DefaultAssetBundle.of(context).loadString('assets/example_data.json'),
                      ),),
        ),
      )
    );
  }
}
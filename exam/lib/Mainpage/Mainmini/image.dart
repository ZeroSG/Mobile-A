import 'dart:convert';

import 'package:flutter/material.dart';


class Images extends StatefulWidget {
    final String documetId;
  const Images({ Key? key, required this.documetId }) : super(key: key);
  
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child:  FutureBuilder(builder: (context, snapshot){
                      var showData= json.decode(snapshot.data.toString());
                      return ListView.builder(
                        itemCount: showData.length,
                        itemBuilder: (BuildContext context, int index){
                          if(showData[index]['name'] == widget.documetId){
                            List<String> imagesL = new List<String>.from(showData[index]['images']);
                             return  Column(
                              children: [
                                Image.network(showData[index]['images'][0]),
                                Image.network(showData[index]['images'][1]),
                                Image.network(showData[index]['images'][2]),
                                
                              ],
                            );
                        
                          }
                          else{}
                          return  Column(
                              
                            );
                        
                          
                        },);

                    }, future: DefaultAssetBundle.of(context).loadString('assets/example_data.json'),
                    ),
        ))
    );
  }
}
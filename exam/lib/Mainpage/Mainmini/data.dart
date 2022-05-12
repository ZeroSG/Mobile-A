import 'dart:convert';

import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  final String documetId;
  const Data({Key? key, required this.documetId}) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
      child: FutureBuilder(
        builder: (context, snapshot) {
          var showData = json.decode(snapshot.data.toString());
          return ListView.builder(
            itemCount: showData.length,
            itemBuilder: (BuildContext context, int index) {
              if (showData[index]['name'] == widget.documetId) {
                return Column(
                  children: [
                    SizedBox(height: 15.0),
                    Text('Data',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        )),
                    Image.network(showData[index]['profile_image_url']),
                    ListTile(
                      title: Text(showData[index]['name']),
                    ),
                    ListTile(
                      title: Text('Address :'),
                      subtitle: Text(
                        showData[index]['address'],
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ListTile(
                      title: const Text('Opening Hour :'),
                      subtitle: Text(
                        'Monday: 10:00 AM – 6:00 PM ',
                        // showData[index]['operation_time']['day'].toString(),
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ListTile(
                      subtitle: Text(
                        'Tuesday: 10:00 AM – 6:00 PM ',
                        // showData[index]['operation_time']['day'].toString(),
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ListTile(
                      subtitle: Text(
                        'Wednesday: 10:00 AM – 6:00 PM',
                        // showData[index]['operation_time']['day'].toString(),
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ListTile(
                      subtitle: Text(
                        'Thursday: 10:00 AM – 6:00 PM',
                        // showData[index]['operation_time']['day'].toString(),
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ListTile(
                      subtitle: Text(
                        'Friday: 10:00 AM – 6:00 PM',
                        // showData[index]['operation_time']['day'].toString(),
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ListTile(
                      subtitle: Text(
                        'Saturday: Closed Sunday: Closed',
                        // showData[index]['operation_time']['day'].toString(),
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                );
              } else {}
              return Column();
            },
          );
        },
        future: DefaultAssetBundle.of(context)
            .loadString('assets/example_data.json'),
      ),
      //           child: Column(
      //   children: <Widget>[
      //     SizedBox(height: 15.0),
      //     Text(
      //       'Data',
      //       style: TextStyle(
      //         fontSize: 42,
      //         fontWeight: FontWeight.bold,
      //       )
      //       ),
      //       SizedBox(height: 15.0),
      //       Image.asset('images/1.png'),
      //        ListTile(
      //             title: const Text('DAI LOU MODERN CHINESE CUISINE'),
      //           ),
      //           ListTile(
      //             title: const Text('Address :'),
      //             subtitle: Text(
      //               '55/5 Soi Phahon Yothin 2, Khwaeng Samsen Nai, Khet Phaya Thai, Krung Thep Maha Nakhon 10400, Thailand',
      //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
      //             ),
      //           ),
      //           ListTile(
      //             title: const Text('Opening Hour :'),
      //             subtitle: Text(
      //               'Monday: 10:00 AM – 6:00 PM Tuesday: 10:00 AM – 6:00 PM Wednesday: 10:00 AM – 6:00 PM Thursday: 10:00 AM – 6:00 PM Friday: 10:00 AM – 6:00 PM Saturday: Closed Sunday: Closed',
      //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
      //             ),
      //           ),

      //   ],
      // ),
    )));
  }
}

import 'package:flutter/material.dart';

import 'view_model.dart';
import 'model.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Youtube Data API Example'),
        ),
        drawer: Drawer(
            child: ListView(children: [
          Text('Drawer'),
          Text('aaa'),
          Text('bbb'),
        ])),
        body: ListView(
          children: <Widget>[
            FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        // for()
                        ListTile(
                          title: Text(snapshot.data!.title),
                          leading: Image.network(snapshot.data!.thumbnails),
                          subtitle: Text(snapshot.data!.channelTitle),
                          // trailing: Text(snapshot.data!.channelId)
                        ),
                      ]);
                  // Text(snapshot.data!.description),

                  // Link({required Uri: 'https://www.youtube.com/channel/${snapshot.data!.channelId}', builder: builder}),
                  // print(snapshot.data!.channelId),
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class CardExample extends StatelessWidget {
//   const CardExample({required Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(8.0),
//       children: <Widget>[
//         Card(
//           color: Colors.red,
//           // The elevation determines shade.
//           elevation: 10.0,
//           child: SizedBox(
//             height: 100.0,
//             child: Row(
//               children: const <Widget>[
//                 Expanded(child: Text('Card 1')),
//               ],
//             ),
//           ),
//         ),
//         Card(
//           color: Colors.green,
//           margin: const EdgeInsets.all(20.0),
//           elevation: 0.0,
//           child: SizedBox(
//             height: 100.0,
//             child: InkWell(
//               splashColor: Colors.deepOrange,
//               onTap: () {},
//               child: Row(
//                 children: const <Widget>[
//                   Expanded(
//                     child: Text('Card 2 (with Inkwell effect on tap)'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Card(
//           color: Colors.blue,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30.0),
//               topRight: Radius.elliptical(40.0, 80.0),
//             ),
//           ),
//           child: SizedBox(
//             height: 100.0,
//             child: Row(
//               children: const <Widget>[
//                 Expanded(
//                   child: Text('Card 3 (with custom border radius)'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Card(
//           color: Colors.white,
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 180.0,
//                 child: Stack(
//                   children: <Widget>[
//                     Positioned.fill(
//                       child: Image.asset(
//                         'res/images/material_design_4.jpg',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 16.0,
//                       left: 16.0,
//                       right: 16.0,
//                       child: FittedBox(
//                         fit: BoxFit.scaleDown,
//                         alignment: Alignment.centerLeft,
//                         child: Text('Card 4 (complex example)',
//                             style: Theme.of(context).textTheme.headline5
//                             // .copyWith(color: Colors.white),
//                             ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               ButtonBar(
//                 alignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text('SHARE'),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text('EXPLORE'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

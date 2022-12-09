import 'package:flutter/material.dart';
import 'package:search/models/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Search Names'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //variable that stores the full content search item after the user has search
  List<Data>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      //Contains our TextFormfield for search
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: ((value) {
                //print(":::::::::::::::::::onchanged value $value");
                setState(() {
                  //
                  //Get the searched value with the .where property and return the ele in the List [SocialData]
                  data = socialData
                      .where((element) =>
                          element.title!.toLowerCase().startsWith(value))
                      .toList();
                  //print(":::::::::::::::::::onchanged data $data");
                  // Last trick: makes dataLength and data[List] null again so it would display the default stuff when no name is searched
                  if (value.isEmpty) {
                    data = null;
                  } else {
                    data = data;
                  }
                });
              }),
              decoration: InputDecoration(
                hintText: "Search names",
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
          ),

          //Standard Search funtionality
          
          if (data == null)
            const Center(child: Text("I'm waiting for you to search a  name ")),

          if (data != null)
            ...List.generate(
              data!.length,
              (index) {
                final snapshot = data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tileColor: const Color.fromARGB(255, 201, 198, 198),
                    title: Text(snapshot.title!),
                    subtitle: Text(snapshot.number!.toString()),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

//Not so effiecent wat of searching

// import 'package:flutter/material.dart';
// import 'package:search/models/data.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Search Names'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   //variable to the text.lenght of the searched item in the TextFormField
//   int? dataLength;

//   //variable that stores the full content search item after the user has searh
//   List<Data>? data;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//       //Contains our TextFormfield for search
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: ((value) {
//                 //print(":::::::::::::::::::onchanged value $value");
//                 setState(() {
//                   //Get the lenght of the "value" typed
//                   dataLength = socialData
//                       .where((element) =>
//                           element.title!.toLowerCase().startsWith(value))
//                       .length;
//                   //print(":::::::::::::::::::onchanged dataLength $dataLength");
//                   //get the searched value with the element property in the List [SocialData]
//                   data = socialData
//                       .where((element) =>
//                           element.title!.toLowerCase().startsWith(value))
//                       .toList();
//                   //print(":::::::::::::::::::onchanged data $data");
//                   //makes dataLength null again so it would display the default stuff when no name is searched
//                 });
//               }),
//               decoration: InputDecoration(
//                 hintText: "Search names",
//                 suffixIcon: GestureDetector(
//                   onTap: () {},
//                   child: const Icon(
//                     Icons.search,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Generated stuff that comes as the search result
//           //for index : dataLength ?? socialData.length,---works too
//           ...List.generate(
//             dataLength == null ? socialData.length : dataLength!,
//             (index) {
//               //  final snapshot = socialData[index];
//               final snapshot = data == null ? socialData[index] : data![index];
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListTile(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   tileColor: const Color.fromARGB(255, 201, 198, 198),
//                   title: Text(snapshot.title!),
//                   subtitle: Text(snapshot.number!.toString()),
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

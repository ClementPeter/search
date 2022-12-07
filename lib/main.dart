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
      home: const MyHomePage(title: 'Search Month'),
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
  TextEditingController controller = TextEditingController();

  int?
      dataLength; //variable to the text.lenght of the searched item in the TextFormField

  List<Data>?
      data; //variable that stores the full content search item after the user has searh
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
              child: TextFormField(
                controller: controller,
                onChanged: ((value) {
                //  print(":::::::::::::::::::onchanged $value");
                  setState(() {
                    //Get the lenght of the "value" typed
                    dataLength = socialData
                        .where((element) =>
                            element.title!.toLowerCase().startsWith(value))
                        .length;
                    print(":::::::::::::::::::onchanged $dataLength");

                    //get the searched value 
                    data = socialData
                        .where((element) =>
                            element.title!.toLowerCase().startsWith(value))
                        .toList();
                    print(":::::::::::::::::::onchanged $data");
                  });
                }),
                // onEditingComplete: (() {
                //   print(
                //       ":::::::::::::::::::onEditingcomplete ${controller.text}");
                // }),
                decoration: InputDecoration(
                  hintText: "Search names",
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: const  Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
            ),
            ...List.generate(socialData.length, (index) {
              final snapshot = socialData[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(width: 2, color: Colors.amberAccent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Color.fromARGB(255, 201, 198, 198),
                  title: Text(snapshot.title!),
                  subtitle: Text(snapshot.number!.toString()),
                ),
              );
            })
          ],
        ));
  }
}

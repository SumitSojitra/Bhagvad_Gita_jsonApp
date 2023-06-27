import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade800,
        title: Text(
          "Bhagavad Geeta",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.brown.shade800,
      body: FutureBuilder(
        future: rootBundle.loadString("lib/utils/jsonData/geeta.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String data = snapshot.data!;
            Map decodedData = jsonDecode(data);
            List myData = decodedData['data'];

            List<Geeta> GeetaData =
                myData.map((e) => Geeta.formMap(data: e)).toList();

            return ListView.builder(
                itemCount: GeetaData.length,
                itemBuilder: (context, i) => Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('detail_page',
                                  arguments: GeetaData[i]);
                            },
                            child: Container(
                              height: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/scroll.png"),
                                      fit: BoxFit.cover)),
                              child: Text(
                                GeetaData[i].san,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ));
          } else if (snapshot.hasError) {}
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

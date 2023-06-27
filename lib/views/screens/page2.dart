import 'package:flutter/material.dart';

import '../../model/model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    List<Geeta> data =
        ModalRoute.of(context)!.settings.arguments as List<Geeta>;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page "),
      ),
      body: Center(
        child: Text(data[0].no),
      ),
    );
  }
}

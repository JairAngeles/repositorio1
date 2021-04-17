import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:prueba/models/results_models.dart';

// ignore: camel_case_types
class Api2_page extends StatefulWidget {
  @override
  Aapi2State_page createState() => Aapi2State_page();
}

// ignore: camel_case_types
class Aapi2State_page extends State<Api2_page> {
  Model model;
  List<Results> list;
  Future getDataFromApi() async {
    final url =
        await http.get(Uri.parse("https://randomuser.me/api/?results=20"));
    if (url.statusCode == 200) {
      model = Model.fromJson(jsonDecode(url.body));
      setState(() {
        list = model.results;
      });
    } else {
      throw Exception('Fallo la api');
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    getDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Llamada a Api - Jair'),
      ),
      body: list == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, i) {
                final user = list[i];

                return Column(
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundImage: NetworkImage(user.picture.medium),
                    ),
                    Text(user.name.first + " " + user.name.last),
                    Text(user.email),
                    Text(user.location.country),
                  ],
                );
              },
            ),
    );
  }
}

// ignore_for_file: unused_import, prefer_const_constructors

import 'package:api14/api_services/api_services.dart';
import 'package:api14/model/apimodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ApiMainScreen extends StatefulWidget {
  const ApiMainScreen({super.key});

  @override
  State<ApiMainScreen> createState() => _ApiMainScreenState();
}

class _ApiMainScreenState extends State<ApiMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Of Products"),
      ),
      body: FutureBuilder(
        future: getCard(),
        builder: (context, AsyncSnapshot shanpshot) {
          if (!shanpshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Cart> product = shanpshot.data;
            return ListView.builder(
              itemCount: product.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Text(product[index].id.toString()),
                    // Text(product[index].totalProducts.toString()),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}

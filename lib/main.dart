import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/loading.dart';
import 'Pages/location.dart';

void main ()=> runApp(MaterialApp(
   debugShowCheckedModeBanner: false,
   initialRoute: '/', // eta diya chaile kon page age load nibe select kora jay
   routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => Location(),
   },
)
);
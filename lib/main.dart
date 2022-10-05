import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mvp_grid/pages/home.dart';
import 'package:mvp_grid/pages/data_table.dart';
import 'package:mvp_grid/pages/editable.dart';


void main() {
  runApp(MaterialApp(
    title: 'PoC Grid',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => NotifyWidget(),
      '/datatable': (BuildContext context) => const DataTablePage(),
      '/editable': (BuildContext context) => const EditablePage(),
    },
  ));
}
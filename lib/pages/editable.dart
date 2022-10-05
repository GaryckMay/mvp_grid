import 'package:flutter/material.dart';
import 'package:mvp_grid/widgets/editable_table.dart';

import '../models/desk.dart';

class EditablePage extends StatelessWidget {
  const EditablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editable Table'),
      ),
      body: const EditableWidget(),
    );
  }
}

/*
class JsonCoder {
  List<Desk> decode(List<dynamic> json) {
    return json
    .map((dynamic e) => Desk.fromJson(e as Map<String, dynamic>))
    .toList();
  }
}
*/

import 'package:flutter/material.dart';
import 'package:mvp_grid/clients/api.dart';
import 'package:mvp_grid/widgets/models/home_model.dart';
import 'package:provider/provider.dart';

class GetWordFileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final host = context.watch<Model>().host;
    return ElevatedButton(
      onPressed: () async {
        Api().getWordFile(host);
      },
      child: const Text('Get Generated Word File'),
    );
  }
}

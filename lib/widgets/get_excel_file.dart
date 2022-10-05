import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp_grid/clients/api.dart';
import 'package:mvp_grid/widgets/models/home_model.dart';
import 'package:provider/provider.dart';

class GetExcelFileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final host = context.watch<Model>().host;
    return ElevatedButton(
      onPressed: () async {
        Api().getExcelFile(host);
      },
      child: const Text('Get Generated Excel File'),
    );
  }
}

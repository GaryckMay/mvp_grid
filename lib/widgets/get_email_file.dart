import 'package:flutter/material.dart';
import 'package:mvp_grid/clients/api.dart';
import 'package:mvp_grid/widgets/models/home_model.dart';
import 'package:provider/provider.dart';

class GetEmailFileButton extends StatelessWidget {
  const GetEmailFileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text1 = context.watch<Model>().text1;
    final text2 = context.watch<Model>().text2;
    final text3 = context.watch<Model>().text3;
    final text4 = context.watch<Model>().text4;
    final text5 = context.watch<Model>().text5;
    final text6 = context.watch<Model>().text6;
    final host = context.watch<Model>().host;
    return ElevatedButton(
      onPressed: () async {
        Api().getEmailFile(host,text1,text2,text3,text4,text5,text6);
      },
      child: const Text('Get Generated Email File'),
    );
  }
}
import 'package:mvp_grid/widgets/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:mvp_grid/clients/api.dart';
import 'package:mvp_grid/widgets/snack_bar.dart';
import 'package:provider/provider.dart';


class AutomateBrowser extends StatelessWidget {
  const AutomateBrowser({Key? key}) : super(key: key);

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
        final result=await Api().getSiteData(host);
        // ignore: use_build_context_synchronously
        snackBar(context,result,result=="Error");
      },
      child: const Text('Automatize browser'),
    );
  }
}

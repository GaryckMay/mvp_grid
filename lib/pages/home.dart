import 'package:flutter/material.dart';
import 'package:mvp_grid/widgets/automate_bowser.dart';
import 'package:mvp_grid/widgets/file_picker.dart';
import 'package:mvp_grid/widgets/get_email_file.dart';
import 'package:mvp_grid/widgets/get_excel_file.dart';
import 'package:mvp_grid/widgets/get_word_file.dart';
import 'package:mvp_grid/widgets/models/home_model.dart';
import 'package:mvp_grid/widgets/models/upload_xml.dart';
import 'package:provider/provider.dart';

/*class NotifyWidget extends StatefulWidget {
  @override
  _NotifyWidgetState createState() => _NotifyWidgetState();
}*/

class NotifyWidget extends StatelessWidget {
  final model = Model();

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider(
        create: (context) => Model(),
        child: const HomePage(),
      );
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model=context.read<Model>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 10,),
          TextFormField(initialValue: 'http://127.0.0.1:8888',onChanged: (val)=>model.changeText(7, val),),
          TextFormField(initialValue: 'Text1',onChanged: (val)=>model.changeText(1, val),),
          TextFormField(initialValue: 'Text2',onChanged: (val)=>model.changeText(2, val),),
          TextFormField(initialValue: 'Text3',onChanged: (val)=>model.changeText(3, val),),
          TextFormField(initialValue: 'Text4',onChanged: (val)=>model.changeText(4, val),),
          TextFormField(initialValue: 'Text5',onChanged: (val)=>model.changeText(5, val),),
          TextFormField(initialValue: 'Text6',onChanged: (val)=>model.changeText(6, val),),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/datatable');
            },
            child: const Text('Open Table with pagination'),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/editable');
            },
            child: const Text('Open Editable table'),
          ),
          const SizedBox(height: 10,),
          const FileUploadButton(),
          const SizedBox(height: 10,),
          GetExcelFileButton(),
          const SizedBox(height: 10,),
          GetWordFileButton(),
          const SizedBox(height: 10,),
          GetEmailFileButton(),
          const SizedBox(height: 10,),
          const UploadXML(),
          const SizedBox(height: 10,),
          const AutomateBrowser(),
        ]),
      ),
    );
  }
}


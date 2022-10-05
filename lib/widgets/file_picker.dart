import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mvp_grid/clients/api.dart';
import 'package:mvp_grid/widgets/models/home_model.dart';
import 'package:provider/provider.dart';

class FileUploadButton extends StatelessWidget {
  const FileUploadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final host = context.watch<Model>().host;
    return ElevatedButton(
      child: const Text('UPLOAD FILE'),
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['xlsx'],
          withData: false,
          withReadStream: true,
        );

        if (picked != null) {
          final file = picked.files.first;

          print(picked.files[0].name);
          final fileReadStream = file.readStream;
          if (fileReadStream == null) {
            throw Exception('Cannot read file from null stream');
          }
          Api().uploadFile(fileReadStream,file.size,file.name,host,'uploadXLSX');
        }
      },
    );
  }
}
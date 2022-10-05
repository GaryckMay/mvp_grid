import 'package:flutter/material.dart';
import 'package:mvp_grid/widgets/data_table.dart';

class DataTablePage extends StatelessWidget {
  const DataTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table with pagination'),
      ),
      body: const SingleChildScrollView(
          child: DataTableWidget()
      ),
    );
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvp_grid/clients/api.dart';
import 'package:mvp_grid/models/desk.dart';
import 'package:mvp_grid/utils.dart';
import 'package:mvp_grid/widgets/models/home_model.dart';
import 'package:mvp_grid/widgets/scrollable.dart';
import 'package:mvp_grid/widgets/text_dialog.dart';
import 'package:provider/provider.dart';

class EditableWidget extends StatefulWidget {
  const EditableWidget({Key? key}) : super(key: key);

  @override
  EditableState createState() => EditableState();
}

class EditableState extends State<EditableWidget> {
  List<Desk> desks = [];
  //final model = EditableWidgetModel();

  @override
  void initState() {
    final host = context.watch<Model>().host;
    super.initState();
    Api().getDesks(host).then((value) {
      final json=jsonDecode(value);
      desks=JsonCoder().decode(json['data']);
    });
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['id', 'Name', 'Lists'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(desks),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isId = column == columns[0];

      return DataColumn(
        label: Text(column),
        numeric: isId,
      );
    }).toList();
  }

  List<DataRow> getRows(List<Desk> desks) =>
      desks.map((Desk desk) {
        final cells = [desk.id, desk.name, jsonEncode(desk.lists.map((i) => i.toJson()).toList()).toString()];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 1 || index == 2;

            return DataCell(
              Text('$cell'),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 1:
                    editName(desk);
                    break;
                  case 2:
                    editLists(desk);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editName(Desk editDesk) async {
    final name = await showTextDialog(
      context,
      title: 'Change Name desk',
      value: editDesk.name,
    );

    setState(() =>
    desks = desks.map((desk) {
      final isEditedDesk = desk == editDesk;

      return isEditedDesk ? desk.copy(name: name) : desk;
    }).toList());
  }

  Future editLists(Desk editDesk) async {
    final lists = await showTextDialog(
      context,
      title: 'Change Lists',
      value: editDesk.lists.toString(),
    );

    setState(() =>
    desks = desks.map((desk) {
      final isEditedDesk = desk == editDesk;

      return isEditedDesk ? desk.copy(lists: lists) : desk;
    }).toList());
  }
}

class JsonCoder {
  List<Desk> decode(List<dynamic> json) {
    return json
        .map((dynamic e) => Desk.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
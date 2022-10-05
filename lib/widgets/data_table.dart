import 'dart:math';
import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title;
  final int price;
  bool selected = false; // По умолчанию не выбрано
  Product(this.id, this.title, this.price);
}

// The "source" of the table
class MyData extends DataTableSource {
  bool selected = false; // По умолчанию не выбрано
  // Generate some made-up data
  final List<Product> _data = List.generate(
      200, (index) => Product(index, "Index $index", Random().nextInt(10000)));

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;

  int _selectCount = 0; // Количество выбранных строк

  @override
  DataRow getRow(int index) {
    final Product product = _data[index];
    return DataRow.byIndex(
      cells: <DataCell>[
        DataCell(Text(product.id.toString())),
        DataCell(Text(product.title)),
        DataCell(Text(product.price.toString())),
      ],
      selected: product.selected,
      index: index,
      onSelectChanged: (isSelected) { //for selection row
        selectOne(index, isSelected!);
      },
    );
  }

  // Выбираем сингл
  void selectOne(int index, bool isSelected) {
    Product product = _data[index];
    if (product.selected != isSelected) {
      // Если выбрано, выбранное количество плюс один, иначе минус один
      _selectCount = _selectCount += isSelected ? 1 : -1;
      product.selected = isSelected;
      //Обновить
      notifyListeners();
    }
  }

  //Сортировать,
  void _sort<T>(Comparable<T> Function(Product product) getField,bool b){
    _data.sort((Product s1,Product s2){
      if(!b){// Обмен двух предметов
        final Product temp=s1;
        s1=s2;
        s2=temp;
      }
      final Comparable<T> s1Value=getField(s1);
      final Comparable<T> s2Value=getField(s2);
      return Comparable.compare(s1Value, s2Value);
    });
    notifyListeners();
  }
}

class DataTableWidget extends StatefulWidget {
  const DataTableWidget({Key? key}) : super(key: key);

  @override
  DataTableState createState() => DataTableState();
}

class DataTableState extends State<DataTableWidget> {
  final MyData _data = MyData();
  int _defalultRowPageCount = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  // Сортировка ассоциации _sortColumnIndex, _sortAscending
  void _sort<T>(Comparable<T> Function(Product s) getField,int index,bool b){
    _data._sort(getField, b);
    setState(() {
      this._sortColumnIndex=index;
      this._sortAscending=b;
    });
  }

  List<DataColumn> getColumn() {
    return [
      DataColumn(label: const Text('ID'),onSort: (i,b){_sort<num>((Product p) =>p.id, i, b);}),
      DataColumn(label: const Text('Name'),onSort: (i,b){_sort<String>((Product p) =>p.title, i, b);}),
      DataColumn(label: const Text('Price'),onSort: (i,b){_sort<num>((Product p) =>p.price, i, b);}),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      source: _data,
      header: const Text('Table header'),
      columns: getColumn(),
      columnSpacing: 100,
      horizontalMargin: 10,
      rowsPerPage: _defalultRowPageCount,
      sortColumnIndex: _sortColumnIndex,
      sortAscending: _sortAscending,
      onRowsPerPageChanged: (value) {
        setState(() {
          _defalultRowPageCount = value!;
        });
      },
      availableRowsPerPage: const [5, 10, 20, 30],
      showCheckboxColumn: true,
    );
  }
}

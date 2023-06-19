import 'package:admin_dashboard/proy/databases/users_datasource.dart';
import 'package:admin_dashboard/proy/providers/users_provider.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/widget/datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excel/excel.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';

class ResponsiveTable extends StatelessWidget {
  
  const ResponsiveTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDataSource = UsersDataSource(usersProvider.users);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                const Text(
                  Strings.responsiveTable,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                FxButton(
                  borderRadius: 4,
                  onPressed: () {
                    _exportExcel();
                  },
                  text: 'Export',
                ),
              ],
            ),
            FxBox.h20,
            SizedBox(
              height: MediaQuery.of(context).size.height - 240,
              child: DataTable3(
                sortAscending: usersProvider.ascending,
                sortColumnIndex: usersProvider.sortColumndIndex,
                minWidth: 600,
                dividerThickness: 1,
                showBottomBorder: true,
                columns: _dataColumn(usersProvider),
                rows: List.generate(
                  50,
                  (index) => DataRow2(
                    cells: [
                      DataCell(sizedBox(text: '${index + 1}')),
                      DataCell(sizedBox(text: "Jane")),
                      DataCell(sizedBox(text: "Deo")),
                      DataCell(sizedBox(text: "@jane_deo")),
                      DataCell(sizedBox(text: "flutter")),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<DataColumn2> _dataColumn(UsersProvider usersProvider) {
    return [
      DataColumn2(
        size: ColumnSize.S,
        label: sizedBox(
          text: "#",
          fontwidget: FontWeight.bold,
        ),
        onSort: (columnIndex, _) {
          usersProvider.sortColumndIndex = columnIndex;
          usersProvider.sort<String>((user) => user.nombre);
        },
      ),
      DataColumn2(
        size: ColumnSize.L,
        label: sizedBox(
          text: "Fist Name",
          fontwidget: FontWeight.bold,
        ),
      ),
      DataColumn2(
        size: ColumnSize.L,
        label: sizedBox(
          text: "Last Name",
          fontwidget: FontWeight.bold,
        ),
      ),
      DataColumn2(
        size: ColumnSize.L,
        label: sizedBox(
          text: "User Name",
          fontwidget: FontWeight.bold,
        ),
      ),
      DataColumn2(
        size: ColumnSize.L,
        label: sizedBox(
          text: "Department",
          fontwidget: FontWeight.bold,
        ),
      ),
    ];
  }

  Widget sizedBox({String? text, FontWeight? fontwidget = FontWeight.normal}) {
    return Text(
      '$text',
      softWrap: true,
      style: TextStyle(fontSize: 17, fontWeight: fontwidget),
    );
  }

  Future<void> _exportExcel() async {
    List<String> titleList = [
      '#',
      'First Name',
      'Last Name',
      'User Name',
    ];
    var excel = Excel.createExcel();
    excel.sheets['Sheet1']!.insertRowIterables(titleList, 0);

    for (var i = 0; i < 50; i++) {
      final List<String> list = ['${i + 1}', 'Jane', 'Deo', '@flutter'];
      excel.sheets['Sheet1']!.insertRowIterables(list, i + 1);
    }

    excel.save(fileName: 'FlutterAdmin.xlsx');
  }
}

import 'package:admin_dashboard/src/provider/table/editabletable/bloc/editable_table_bloc.dart';
import 'package:admin_dashboard/src/widget/datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';

class EditableTable extends StatefulWidget {
  const EditableTable({Key? key}) : super(key: key);

  @override
  State<EditableTable> createState() => _EditableTableState();
}

class _EditableTableState extends State<EditableTable> {
  final EditableTableBloc _editableTableBloc = EditableTableBloc();

  int _selectedIndex = -1;

  final name1 = TextEditingController();
  final age1 = TextEditingController();
  final id1 = TextEditingController();
  final gender1 = TextEditingController();
  final mobile1 = TextEditingController();

  final name2 = TextEditingController();
  final age2 = TextEditingController();
  final id2 = TextEditingController();
  final gender2 = TextEditingController();
  final mobile2 = TextEditingController();

  final name3 = TextEditingController();
  final age3 = TextEditingController();
  final id3 = TextEditingController();
  final gender3 = TextEditingController();
  final mobile3 = TextEditingController();

  final name4 = TextEditingController();
  final age4 = TextEditingController();
  final id4 = TextEditingController();
  final gender4 = TextEditingController();
  final mobile4 = TextEditingController();

  final name5 = TextEditingController();
  final age5 = TextEditingController();
  final id5 = TextEditingController();
  final gender5 = TextEditingController();
  final mobile5 = TextEditingController();

  List<Map<String, dynamic>> ls = [
    {
      "id": "1",
      "name": "jane_deo",
      "mobile": "12121212",
      "dob": "22/01/1998",
      "gender": "Female"
    },
    {
      "id": "2",
      "name": "joe_blow",
      "mobile": "65656565",
      "dob": "02/04/2000",
      "gender": "Male"
    },
    {
      "id": "3",
      "name": "jhon_wick",
      "mobile": "9988776655",
      "dob": "15/10/1995",
      "gender": "Male"
    },
    {
      "id": "4",
      "name": "joe_wick",
      "mobile": "1234567890",
      "dob": "11/10/1999",
      "gender": "Male"
    },
    {
      "id": "5",
      "name": "jane_blow",
      "mobile": "9876543210",
      "dob": "31/07/1996",
      "gender": "Female"
    },
  ];

  late List<Map<String, dynamic>> _controller;

  @override
  void initState() {
    super.initState();
    _controller = [
      {"name": name1, "dob": age1, "gender": gender1, "mobile": mobile1},
      {"name": name2, "dob": age2, "gender": gender2, "mobile": mobile2},
      {"name": name3, "dob": age3, "gender": gender3, "mobile": mobile3},
      {"name": name4, "dob": age4, "gender": gender4, "mobile": mobile4},
      {"name": name5, "dob": age5, "gender": gender5, "mobile": mobile5},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _editableTableBloc,
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Editable Table',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FxBox.h20,
              SizedBox(
                height: 296,
                child: BlocBuilder<EditableTableBloc, EditableTableState>(
                  builder: (context, state) {
                    return DataTable3(
                      minWidth: 700,
                      columns: [
                        DataColumn2(
                          label:
                              sizedBox(text: "ID", fontwidget: FontWeight.bold),
                          size: ColumnSize.S,
                        ),
                        DataColumn2(
                          label: sizedBox(
                              text: "Username", fontwidget: FontWeight.bold),
                          size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: sizedBox(
                              text: "Mobile No", fontwidget: FontWeight.bold),
                          size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: sizedBox(
                              text: "Birth Date", fontwidget: FontWeight.bold),
                          size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: sizedBox(
                              text: "Gender", fontwidget: FontWeight.bold),
                          size: ColumnSize.M,
                        ),
                        DataColumn2(
                          label: sizedBox(
                              text: "Edit", fontwidget: FontWeight.bold),
                          size: ColumnSize.S,
                        ),
                      ],
                      rows: List.generate(
                        5,
                        (index) => DataRow2(
                          onDoubleTap: () {
                            if (_selectedIndex != index) {
                              _selectedIndex = index;
                            } else {
                              _selectedIndex = -1;
                            }
                            if (_selectedIndex == index) {
                              updateContollerValue(index);
                            } else {
                              updateListValue(index);
                            }
                            _editableTableBloc
                                .add(const EditableTableEvent.rebuild());
                          },
                          cells: [
                            DataCell(
                              sizedBox(text: ls[index]["id"].toString()),
                            ),
                            DataCell(
                              _selectedIndex != index
                                  ? sizedBox(text: ls[index]["name"])
                                  : container(
                                      controller: _controller[index]["name"]),
                            ),
                            DataCell(
                              _selectedIndex != index
                                  ? sizedBox(text: ls[index]["mobile"])
                                  : container(
                                      controller: _controller[index]["mobile"]),
                            ),
                            DataCell(
                              _selectedIndex != index
                                  ? sizedBox(text: ls[index]["dob"].toString())
                                  : container(
                                      controller: _controller[index]["dob"]),
                            ),
                            DataCell(
                              _selectedIndex != index
                                  ? sizedBox(text: ls[index]["gender"])
                                  : container(
                                      controller: _controller[index]["gender"]),
                            ),
                            DataCell(
                              IconButton(
                                // splashRadius: 20.0,
                                icon: Icon(
                                  _selectedIndex != index
                                      ? Icons.edit
                                      : Icons.save,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                onPressed: () {
                                  if (_selectedIndex != index) {
                                    _selectedIndex = index;
                                  } else {
                                    _selectedIndex = -1;
                                  }

                                  if (_selectedIndex == index) {
                                    updateContollerValue(index);
                                  } else {
                                    updateListValue(index);
                                  }
                                  _editableTableBloc
                                      .add(const EditableTableEvent.rebuild());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget sizedBox({String? text, FontWeight? fontwidget = FontWeight.normal}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(
        '$text',
        softWrap: true,
        style: TextStyle(fontSize: 17, fontWeight: fontwidget),
      ),
    );
  }

  Widget container({required TextEditingController controller}) {
    return SizedBox(
      height: 30,
      width: 150,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(04)),
        ),
      ),
    );
  }

  void updateListValue(int i) {
    ls[i]["name"] = i == 0
        ? name1.text
        : i == 1
            ? name2.text
            : i == 2
                ? name3.text
                : i == 3
                    ? name4.text
                    : name5.text;
    ls[i]["dob"] = i == 0
        ? age1.text
        : i == 1
            ? age2.text
            : i == 2
                ? age3.text
                : i == 3
                    ? age4.text
                    : age5.text;
    ls[i]["gender"] = i == 0
        ? gender1.text
        : i == 1
            ? gender2.text
            : i == 2
                ? gender3.text
                : i == 3
                    ? gender4.text
                    : gender5.text;
    ls[i]["mobile"] = i == 0
        ? mobile1.text
        : i == 1
            ? mobile2.text
            : i == 2
                ? mobile3.text
                : i == 3
                    ? mobile4.text
                    : mobile5.text;
  }

  void updateContollerValue(int i) {
    var id = ls[i]["id"].toString();
    var name = ls[i]["name"];
    var age = ls[i]["dob"].toString();
    var gender = ls[i]["gender"];
    var mobile = ls[i]["mobile"];

    if (i == 0) {
      id1.text = id;
      name1.text = name;
      age1.text = age;
      gender1.text = gender;
      mobile1.text = mobile;
    } else if (i == 1) {
      id2.text = id;
      name2.text = name;
      age2.text = age;
      gender2.text = gender;
      mobile2.text = mobile;
    } else if (i == 2) {
      id3.text = id;
      name3.text = name;
      age3.text = age;
      gender3.text = gender;
      mobile3.text = mobile;
    } else if (i == 3) {
      id4.text = id;
      name4.text = name;
      age4.text = age;
      gender4.text = gender;
      mobile4.text = mobile;
    } else {
      id5.text = id;
      name5.text = name;
      age5.text = age;
      gender5.text = gender;
      mobile5.text = mobile;
    }
  }
}

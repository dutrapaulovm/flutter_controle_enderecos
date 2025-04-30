import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/presentation/app/apps.dart';
import 'package:flutter_controle_enderecos/presentation/app/table_model.dart';
import 'package:flutter_controle_enderecos/utils/util.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(const MaterialApp(
    home: TableScreen(),
  ));
}

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  late TableModel<Map<String, dynamic>> tableModel;
  late TableModel<Map<String, dynamic>> listModel;

  final TextEditingController _searchController = TextEditingController();
  String _searchField = "name"; // por padrão, começa buscando por "name"
  int? sortColumnIndex;
  bool isAscending = true;
  bool showTableView = true; // alternar entre tabela e lista

  final Map<String, String> _searchLabels = {
    "id": "Buscar por ID",
    "name": "Buscar por Nome",
    "age": "Buscar por Idade",
  };

  @override
  void initState() {
    super.initState();
    tableModel = TableModel<Map<String, dynamic>>(initialItems: [
      {"id": 1, "name": "Ana", "age": 25},
      {"id": 2, "name": "Bruno", "age": 30},
      {"id": 3, "name": "Carlos", "age": 20},
      {"id": 4, "name": "Daniela", "age": 28},
      {"id": 5, "name": "Eduardo", "age": 35},
    ]);

    listModel = TableModel<Map<String, dynamic>>(initialItems: [
      {"id": 1, "name": "Ana", "age": 25},
      {"id": 2, "name": "Bruno", "age": 30},
      {"id": 3, "name": "Carlos", "age": 20},
      {"id": 4, "name": "Daniela", "age": 28},
      {"id": 5, "name": "Eduardo", "age": 35},
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                labelText: "Buscar pelo(a) ${_searchLabels[_searchField]}",
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: isDesktop() ? _buildDataTable() : _buildListView(),
          ),
        ],
      ),
    );
  }

  void _onSearchChanged(String value) async {
    if (value.isEmpty) {
      tableModel.resetFilter();
    } else {
      await tableModel.filterBy((item) => item[_searchField]
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase()));
    }
  }

  void _removeSelected() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Excluir Selecionados"),
          content: const Text(
              "Você tem certeza que deseja excluir os itens selecionados?"),
          actions: [
            TextButton(
              onPressed: () {
                tableModel.removeSelected();
                Navigator.of(context).pop();
              },
              child: const Text("Sim"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Não"),
            ),
          ],
        );
      },
    );
  }

  void _exportToPDF() async {
    final pdf = pw.Document();
    final pdfPath = await _getSavePath();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Table.fromTextArray(
          context: context,
          data: <List<String>>[
            ['ID', 'Nome', 'Idade'],
            ...tableModel.filteredResults.map((e) => [
                  e['id'].toString(),
                  e['name'].toString(),
                  e['age'].toString(),
                ]),
          ],
        );
      },
    ));

    final file = File(pdfPath);
    await file.writeAsBytes(await pdf.save());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF salvo em $pdfPath')),
    );
  }

  Future<String> _getSavePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/tabela.pdf';
  }

  void _onSort<T>(Comparable<T> Function(Map<String, dynamic> item) getField,
      int columnIndex) {
    setState(() {
      if (sortColumnIndex == columnIndex) {
        isAscending = !isAscending;
      } else {
        sortColumnIndex = columnIndex;
        isAscending = true;
      }

      tableModel.filteredResults.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return isAscending
            ? Comparable.compare(aValue, bValue)
            : Comparable.compare(bValue, aValue);
      });
    });
  }

  void _addNewItem() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Adicionar Novo Item"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nome"),
              ),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Idade"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final name = nameController.text;
                final age = int.tryParse(ageController.text);

                if (name.isNotEmpty && age != null) {
                  tableModel.addItem({
                    "id": tableModel.items.length + 1,
                    "name": name,
                    "age": age,
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Adicionar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteListItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Excluir Item'),
          content: const Text('Você tem certeza que deseja excluir este item?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  listModel.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Não'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: listModel.filteredResults.length,
      itemBuilder: (context, index) {
        final item = listModel.filteredResults[index];
        return ListTile(
          leading: Checkbox(
            value: listModel.selectedIndexes.contains(index),
            onChanged: (value) {
              setState(() {
                listModel.toggleRowSelection(index);
              });
            },
          ),
          title: Text((item as Map)['name'].toString()),
          subtitle: Text('ID: ${item['id']} | Idade: ${item['age']}'),
          trailing: PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Excluir') {
                _confirmDeleteListItem(index);
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'Excluir',
                child: Text('Excluir'),
              ),
            ],
          ),
        );
      },
    );
  }

  AnimatedBuilder _buildDataTable() {
    return AnimatedBuilder(
      animation: tableModel,
      builder: (context, _) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              sortColumnIndex: sortColumnIndex,
              sortAscending: isAscending,
              columns: [
                DataColumn(
                  label: const Text('ID'),
                  onSort: (columnIndex, _) {
                    _searchField = "id"; // <- adiciona isso aqui
                    _onSort<num>((item) => item['id'], columnIndex);
                  },
                ),
                DataColumn(
                  label: const Text('Nome'),
                  onSort: (columnIndex, _) {
                    _searchField = "name"; // <- aqui
                    _onSort<String>((item) => item['name'], columnIndex);
                  },
                ),
                DataColumn(
                  label: const Text('Idade'),
                  onSort: (columnIndex, _) {
                    _searchField = "age"; // <- e aqui
                    _onSort<num>((item) => item['age'], columnIndex);
                  },
                ),
                const DataColumn(label: Text('')),
              ],
              rows: List<DataRow>.generate(
                tableModel.filteredResults.length,
                (index) {
                  final item = tableModel.filteredResults[index];
                  final originalIndex = tableModel.items.indexOf(item);
                  final selected =
                      tableModel.selectedIndexes.contains(originalIndex);

                  return DataRow(
                    selected: selected,
                    onSelectChanged: (bool? selected) {
                      tableModel.toggleRowSelection(originalIndex);
                    },
                    cells: [
                      DataCell(Text(item["id"].toString())),
                      DataCell(Text(item["name"].toString())),
                      DataCell(Text(item["age"].toString())),
                      DataCell(
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'Excluir') {
                              _confirmDeleteTableItem(originalIndex);
                            }
                          },
                          itemBuilder: (BuildContext context) => [
                            const PopupMenuItem<String>(
                              value: 'Excluir',
                              child: Text('Excluir'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _confirmDeleteTableItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Excluir Item'),
          content: const Text('Você tem certeza que deseja excluir este item?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  tableModel.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Não'),
            ),
          ],
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Exemplo DataTable Flutter'),
      actions: [
        IconButton(
          onPressed: () {
            if (tableModel.selectedIndexes.isNotEmpty) _removeSelected();
          },
          icon: const Icon(Icons.delete),
          tooltip: 'Remover Selecionados',
        ),
        IconButton(
          onPressed: _exportToPDF,
          icon: const Icon(Icons.picture_as_pdf),
          tooltip: 'Exportar para PDF',
        ),
        IconButton(
          onPressed: _addNewItem,
          icon: const Icon(Icons.add),
          tooltip: 'Adicionar Novo Item',
        ),
        IconButton(
          icon: Icon(showTableView ? Icons.list : Icons.table_chart),
          onPressed: () {
            setState(() {
              showTableView = !showTableView;
            });
          },
        ),
      ],
    );
  }
}

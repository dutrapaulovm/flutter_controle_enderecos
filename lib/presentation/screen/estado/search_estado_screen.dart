// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_controle_enderecos/controller/estado_controller.dart';
import 'package:flutter_controle_enderecos/domain/models/estado.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:flutter_controle_enderecos/presentation/app/apps.dart';
import 'package:flutter_controle_enderecos/presentation/screen/screens.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';
import 'package:flutter_controle_enderecos/utils/util.dart';

class SearchEstadoScreen extends StatefulWidget {
  static const String routeName = "/search_estado_screen";

  const SearchEstadoScreen({super.key});

  @override
  State<SearchEstadoScreen> createState() => SearchEstadoScreenState();
}

class SearchEstadoScreenState
    extends SearchBaseState<SearchEstadoScreen, Estado> {
  final EstadoController estadoController =
      ServiceLocator.instance.getService(ServiceKeys.controllerEstado);

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    setState(() {
      isLoading = true;
    });

    ResultData result = await estadoController.findAll();

    if (!mounted) return;

    setState(() {
      itemProvider.items = result.data;
      itemProvider.init();
    });

    if (!result.success!) {
      showErrorDialog(result, context);
      setState(() => isLoading = false);
      return;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Estado'),
      ),
      body: _buildBody(),
    ));
  }

  Widget _buildBody() {
    return SearchEstadoBody(
      itemProvider: itemProvider,
      filter: (value) => filter(value),
      isLoading: isLoading,
      estadoController: estadoController,
    );
  }
}

class SearchEstadoBody extends StatefulWidget {
  final ListModel<Estado> itemProvider;
  final Function(String value) filter;
  bool isLoading = false;
  final EstadoController estadoController;
  SearchEstadoBody({
    super.key,
    required this.itemProvider,
    required this.filter,
    required this.estadoController,
    required this.isLoading,
  });

  @override
  State<SearchEstadoBody> createState() => _SearchEstadoBodyState();
}

class _SearchEstadoBodyState extends State<SearchEstadoBody> {
  final TextEditingController _fieldController = TextEditingController();
  String searchField = "nome";

  final Map<String, String> _searchLabels = {
    "id": "Buscar por ID",
    "nome": "Buscar por Nome",
    "uf": "Buscar por UF",
  };

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchField(widget.itemProvider),
            spacer(16),
            if (widget.isLoading)
              const Center(child: CircularProgress())
            else
              _buildListView(widget.itemProvider)
          ],
        ));
  }

  Widget _buildSearchField(ListModel itemProvider) {
    return Row(
      children: [
        Flexible(
          child: SearchField(
            controller: _fieldController,
            onChanged: (value) => _onSearchChanged(value),
          ),
        ),
      ],
    );
  }

  Widget _buildListView(ListModel itemProvider) {
    if (widget.isLoading) {
      return const CircularProgressIndicator();
    } else if (itemProvider.filteredResults.isEmpty) {
      return const Text(
        "Nenhum dado encontrado!",
        style: TextStyle(fontSize: 20),
      );
    } else {
      return Expanded(
          child: SizedBox(
              height: 150,
              child: ListenableBuilder(
                listenable: itemProvider,
                builder: (context, child) {
                  return ListView.builder(
                      itemCount: itemProvider.filteredResults.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {},
                            child: InkWell(
                              onTap: () async {
                                Bundle bundle = Bundle();
                                var entity =
                                    itemProvider.filteredResults[index];
                                bundle.put(Argument.entity, entity);
                                await Navigator.pushNamed(
                                    context, EstadoFormScreen.routeName,
                                    arguments: bundle);
                              },
                              child: ListTile(
                                title: Text(
                                    itemProvider.filteredResults[index].nome!),
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
                              ),
                            ));
                      });
                },
              )));
    }
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
                Navigator.of(context).pop();
                _deleteItem(index);
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

  Future<void> _deleteItem(int index) async {
    setState(() => widget.isLoading = true);

    var entity = widget.itemProvider.filteredResults[index];
    widget.estadoController.estadoViewModel.fromEntity(entity);
    ResultData result = await widget.estadoController.delete();

    if (!mounted) return;

    if (!result.success!) {
      showErrorDialog(result, context);
      setState(() => widget.isLoading = false);
      return;
    }

    setState(() => widget.isLoading = false);

    await showMessageDialog("Excluído com sucesso", context);

    setState(() {
      if (result.success!) {
        widget.itemProvider.removeAt(index);
      }
    });
  }

  void _onSearchChanged(String value) async {
    if (value.isEmpty) {
      widget.itemProvider.resetFilter();
    } else {
      await widget.itemProvider.filterBy(
        (item) {
          switch (searchField) {
            case "nome":
              return item.nome
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase());
            case "uf":
              return item.uf
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase());
            default:
              return false;
          }
        },
      );
    }
  }
}

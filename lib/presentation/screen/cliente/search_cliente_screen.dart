// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/cliente_controller.dart';

import 'package:flutter_controle_enderecos/domain/models/cliente.dart';
import 'package:flutter_controle_enderecos/presentation/app/generic_search_screen.dart';
import 'package:flutter_controle_enderecos/presentation/screen/cliente/cliente_form_screen.dart';

import 'package:flutter_controle_enderecos/service_locator.dart';
import 'package:flutter_controle_enderecos/utils/util.dart';

class SearchClienteScreen extends StatefulWidget {
  static const String routeName = "/search_cliente_screen";

  const SearchClienteScreen({super.key});

  @override
  State<SearchClienteScreen> createState() => SearchClienteScreenState();
}

class SearchClienteScreenState extends State<SearchClienteScreen> {
  final ClienteController controller =
      ServiceLocator.instance.getService(ServiceKeys.controllerCliente.name);

  @override
  Widget build(BuildContext context) {
    return GenericSearchScreen<Cliente>(
      title: "Clientes",
      onLoadItems: () async {
        final result = await controller.findAll();
        if (!result.success) {
          throw Exception(result.message);
        }
        return result.data!;
      },
      onTapItem: (cliente) async {
        final bundle = Bundle()..put(Argument.entity, cliente);
        await Navigator.pushNamed(context, ClienteFormScreen.routeName,
            arguments: bundle);
        setState(() {});
      },
      onDeleteItem: (cliente) async {
        controller.clienteViewModel.fromEntity(cliente);
        return await controller.delete();
      },
      searchableFields: {"nome": (c) => c.nome ?? '', "uf": (c) => c.uf ?? ''},
      titleBuilder: (cliente) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cliente.nome!,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(cliente.uf!, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

/*
class SearchClienteScreenState
    extends SearchBaseState<SearchClienteScreen, Cliente> {
  final ClienteController clienteController =
      ServiceLocator.instance.getService(ServiceKeys.controllerCliente);

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    setState(() {
      isLoading = true;
    });

    ResultData result = await clienteController.findAll();

    if (!mounted) return;

    setState(() {
      itemProvider.items = result.data;
      itemProvider.init();
    });

    if (!result.success) {
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
        title: const Text('Cliente'),
      ),
      body: _buildBody(),
    ));
  }

  Widget _buildBody() {
    return SearchClienteBody(
      itemProvider: itemProvider,
      filter: (value) => filter(value),
      isLoading: isLoading,
      clienteController: clienteController,
    );
  }
}

class SearchClienteBody extends StatefulWidget {
  final ListModel<Cliente> itemProvider;
  final Function(String value) filter;
  bool isLoading = false;
  final ClienteController clienteController;
  SearchClienteBody({
    super.key,
    required this.itemProvider,
    required this.filter,
    required this.clienteController,
    required this.isLoading,
  });

  @override
  State<SearchClienteBody> createState() => _SearchClienteBodyState();
}

class _SearchClienteBodyState extends State<SearchClienteBody> {
  final TextEditingController _fieldController = TextEditingController();
  String searchField = "nome";

  final Map<String, String> _searchLabels = {
    "id": "Buscar por ID",
    "nome": "Buscar por Nome",
    "uf": "Buscar por UF",
    "ibge": "Buscar por IBGE",
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
                                    context, ClienteFormScreen.routeName,
                                    arguments: bundle);
                                setState(() {}); // se necessário
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
    widget.clienteController.clienteViewModel.fromEntity(entity);
    ResultData result = await widget.clienteController.delete();

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
*/
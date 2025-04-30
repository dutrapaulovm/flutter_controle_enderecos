// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/domain/models/estado.dart';
import 'package:flutter_controle_enderecos/infra/fake/estado_fake_data_source.dart';
import 'package:flutter_controle_enderecos/presentation/app/apps.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';

class SearchEstadoScreen extends StatefulWidget {
  static const String routeName = "/search_estado_screen";

  const SearchEstadoScreen({super.key});

  @override
  State<SearchEstadoScreen> createState() => SearchEstadoScreenState();
}

class SearchEstadoScreenState
    extends SearchBaseState<SearchEstadoScreen, Estado> {
  @override
  void initState() {
    super.initState();
    itemProvider.items = estadoFakeData;
    itemProvider.init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: _buildBody(),
    ));
  }

  Widget _buildBody() {
    return SearchEstadoBody(
      itemProvider: itemProvider,
      filter: (value) => filter(value),
      isLoading: isLoading,
    );
  }
}

class SearchEstadoBody extends StatefulWidget {
  final ListModel itemProvider;
  final Function(String value) filter;
  final bool isLoading;
  SearchEstadoBody(
      {super.key,
      required this.itemProvider,
      required this.filter,
      required this.isLoading});
  @override
  State<SearchEstadoBody> createState() => _SearchEstadoBodyState();
}

class _SearchEstadoBodyState extends State<SearchEstadoBody> {
  final TextEditingController _fieldController = TextEditingController();

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
            onChanged: (value) => widget.filter(value),
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
                          child: ListTile(
                            title:
                                Text(itemProvider.filteredResults[index].nome!),
                          ),
                        );
                      });
                },
              )));
    }
  }
}

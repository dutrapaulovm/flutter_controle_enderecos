// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/controllers.dart';
import 'package:flutter_controle_enderecos/domain/models/estado.dart';
import 'package:flutter_controle_enderecos/presentation/app/generic_search_screen.dart';
import 'package:flutter_controle_enderecos/presentation/screen/screens.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';
import 'package:flutter_controle_enderecos/utils/util.dart';

class SearchEstadoScreen extends StatefulWidget {
  static const String routeName = "/search_estado_screen";

  const SearchEstadoScreen({super.key});

  @override
  State<SearchEstadoScreen> createState() => SearchEstadoScreenState();
}

class SearchEstadoScreenState extends State<SearchEstadoScreen> {
  final EstadoController controller =
      ServiceLocator.instance.getService(ServiceKeys.controllerEstado);

  @override
  Widget build(BuildContext context) {
    return GenericSearchScreen<Estado>(
      title: "Estados",
      onLoadItems: () async {
        final result = await controller.findAll();
        if (!result.success) {
          throw Exception(result.message);
        }
        return result.data!;
      },
      onTapItem: (cidade) async {
        final bundle = Bundle()..put(Argument.entity, cidade);
        await Navigator.pushNamed(context, EstadoFormScreen.routeName,
            arguments: bundle);
        setState(() {});
      },
      onDeleteItem: (cidade) async {
        controller.estadoViewModel.fromEntity(cidade);
        return await controller.delete();
      },
      searchableFields: {"nome": (c) => c.nome ?? '', "uf": (c) => c.uf ?? ''},
      titleBuilder: (cidade) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cidade.nome!,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(cidade.uf!, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
